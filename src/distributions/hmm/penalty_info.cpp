#ifdef MATLAB
#include <stdio.h>
#include <string.h>

#include "lib/io.h"
#include "mex.h"

#include "distributions/hmm/penalty_info.h"

void init_penalty_struct(struct penalty_struct &PEN)
{
	PEN.limits=NULL ;
	PEN.penalties=NULL ;
	PEN.id=-1 ;
	PEN.transform = T_LINEAR ;
	PEN.name = NULL ;
	PEN.max_len=0 ;
	PEN.min_len=0 ;
	PEN.cache=NULL ;
}

void init_penalty_struct_cache(struct penalty_struct &PEN)
{
	if (PEN.cache)
		return ;
		
	REAL* cache=new REAL[PEN.max_len+1] ;
	if (cache)
	{
		for (INT i=0; i<=PEN.max_len; i++)
			cache[i] = lookup_penalty(&PEN, i) ;
		PEN.cache = cache ;
	}
}

void delete_penalty_struct(struct penalty_struct &PEN)
{
	if (PEN.id!=-1)
	{
		delete[] PEN.limits ;
		delete[] PEN.penalties ;
		delete[] PEN.name ;
		delete[] PEN.cache ;
	}
}

void delete_penalty_struct_array(struct penalty_struct *PEN, INT len)
{
	for (int i=0; i<len; i++)
		delete_penalty_struct(PEN[i]) ;
	delete[] PEN ;
}


struct penalty_struct * read_penalty_struct_from_cell(const mxArray * mx_penalty_info, INT &P)
{
	P = mxGetN(mx_penalty_info) ;
	
	struct penalty_struct * PEN = new struct penalty_struct[P] ;
	for (INT i=0; i<P; i++)
		 init_penalty_struct(PEN[i]) ;
	
	for (INT i=0; i<P; i++)
	{
		const mxArray* mx_elem = mxGetCell(mx_penalty_info, i) ;
		if (mx_elem==NULL || !mxIsStruct(mx_elem))
		{
			CIO::message(M_ERROR, "empty cell element\n") ;
			delete_penalty_struct_array(PEN,P) ;
			return NULL ;
		}
		const mxArray* mx_id_field = mxGetField(mx_elem, 0, "id") ;
		if (mx_id_field==NULL || !mxIsNumeric(mx_id_field) || 
			mxGetN(mx_id_field)!=1 || mxGetM(mx_id_field)!=1)
		{
			CIO::message(M_ERROR, "missing id field\n") ;
			delete_penalty_struct_array(PEN,P) ;
			return NULL ;
		}
		const mxArray* mx_limits_field = mxGetField(mx_elem, 0, "limits") ;
		if (mx_limits_field==NULL || !mxIsNumeric(mx_limits_field) ||
			mxGetM(mx_limits_field)!=1)
		{
			CIO::message(M_ERROR, "missing limits field\n") ;
			delete_penalty_struct_array(PEN,P) ;
			return NULL ;
		}
		INT len = mxGetN(mx_limits_field) ;
		
		const mxArray* mx_penalties_field = mxGetField(mx_elem, 0, "penalties") ;
		if (mx_penalties_field==NULL || !mxIsNumeric(mx_penalties_field) ||
			mxGetM(mx_penalties_field)!=1 || mxGetN(mx_penalties_field)!=len)
		{
			CIO::message(M_ERROR, "missing penalties field\n") ;
			delete_penalty_struct_array(PEN,P) ;
			return NULL ;
		}
		const mxArray* mx_transform_field = mxGetField(mx_elem, 0, "transform") ;
		if (mx_transform_field==NULL || !mxIsChar(mx_transform_field))
		{
			CIO::message(M_ERROR, "missing transform field\n") ;
			delete_penalty_struct_array(PEN,P) ;
			return NULL ;
		}
		const mxArray* mx_name_field = mxGetField(mx_elem, 0, "name") ;
		if (mx_name_field==NULL || !mxIsChar(mx_name_field))
		{
			CIO::message(M_ERROR, "missing name field\n") ;
			delete_penalty_struct_array(PEN,P) ;
			return NULL ;
		}
		const mxArray* mx_max_len_field = mxGetField(mx_elem, 0, "max_len") ;
		if (mx_max_len_field==NULL || !mxIsNumeric(mx_max_len_field) ||
			mxGetM(mx_max_len_field)!=1 || mxGetN(mx_max_len_field)!=1)
		{
			CIO::message(M_ERROR, "missing max_len field\n") ;
			delete_penalty_struct_array(PEN,P) ;
			return NULL ;
		}
		const mxArray* mx_min_len_field = mxGetField(mx_elem, 0, "min_len") ;
		if (mx_min_len_field==NULL || !mxIsNumeric(mx_min_len_field) ||
			mxGetM(mx_min_len_field)!=1 || mxGetN(mx_min_len_field)!=1)
		{
			CIO::message(M_ERROR, "missing min_len field\n") ;
			delete_penalty_struct_array(PEN,P) ;
			return NULL ;
		}
		
		INT id = (INT) mxGetScalar(mx_id_field)-1 ;
		if (i<0 || i>P-1)
		{
			CIO::message(M_ERROR, "id out of range\n") ;
			delete_penalty_struct_array(PEN,P) ;
			return NULL ;
		}
		INT max_len = (INT) mxGetScalar(mx_max_len_field) ;
		if (max_len<0 || max_len>1024*1024*100)
		{
			CIO::message(M_ERROR, "max_len out of range\n") ;
			delete_penalty_struct_array(PEN,P) ;
			return NULL ;
		}
		PEN[id].max_len = max_len ;

		INT min_len = (INT) mxGetScalar(mx_min_len_field) ;
		if (min_len<0 || min_len>1024*1024*100)
		{
			CIO::message(M_ERROR, "min_len out of range\n") ;
			delete_penalty_struct_array(PEN,P) ;
			return NULL ;
		}
		PEN[id].min_len = min_len ;

		if (PEN[id].id!=-1)
		{
			CIO::message(M_ERROR, "penalty id already used\n") ;
			delete_penalty_struct_array(PEN,P) ;
			return NULL ;
		}
		PEN[id].id=id ;
		PEN[id].limits = new REAL[len] ;
		PEN[id].penalties = new REAL[len] ;
		double * limits = mxGetPr(mx_limits_field) ;
		double * penalties = mxGetPr(mx_penalties_field) ;
		
		for (INT i=0; i<len; i++)
		{
			PEN[id].limits[i]=limits[i] ;
			PEN[id].penalties[i]=penalties[i] ;
		}
		PEN[id].len = len ;
		
		char *transform_str = mxArrayToString(mx_transform_field) ;				
		char *name_str = mxArrayToString(mx_name_field) ;				

		if (strcmp(transform_str, "log")==0)
			PEN[id].transform = T_LOG ;
		else if (strcmp(transform_str, "log(+3)")==0)
			PEN[id].transform = T_LOG_PLUS3 ;	
		else if (strcmp(transform_str, "(+3)")==0)
			PEN[id].transform = T_LINEAR_PLUS3 ;	
		else if (strcmp(transform_str, "")==0)
			PEN[id].transform = T_LINEAR ;	
		else
		{
			delete_penalty_struct_array(PEN,P) ;
			mxFree(transform_str) ;
			return NULL ;
		}
		PEN[id].name = new char[strlen(name_str)+1] ;
		strcpy(PEN[id].name, name_str) ;

		init_penalty_struct_cache(PEN[id]) ;

		if (PEN->cache)
			CIO::message(M_DEBUG, "penalty_info: name=%s id=%i points=%i min_len=%i max_len=%i transform='%s' (cache initialized)\n", PEN[id].name,
					PEN[id].id, PEN[id].len, PEN[id].min_len, PEN[id].max_len, transform_str) ;
		else
			CIO::message(M_DEBUG, "penalty_info: name=%s id=%i points=%i min_len=%i max_len=%i transform='%s'\n", PEN[id].name,
					PEN[id].id, PEN[id].len, PEN[id].min_len, PEN[id].max_len, transform_str) ;

		
		mxFree(transform_str) ;
		mxFree(name_str) ;
	}
	return PEN ;
}

	
#endif
