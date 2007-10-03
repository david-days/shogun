traindat = ['ACCCTCGTTGTTGCGACTAGAGTTCAGAGCTTCGTGGGAATTAAATCGACCTCCAGAAAC', 'TATGGCGCGTTTGCTTCGAACTGCTGTCTGGTCGAAAACGCCCGTCAGCACCGCTGTGAC', 'CCGCAAGGAAACGTAATAACATGGAGTCGATCGCGGAGACACGCCGGGCGCTACAGGCTG', 'TGGGCAGACCCGTGGGGCGAAGGTCCCTAACATTAGGCATCAACAACAGTGATGGTGACG', 'TTAAAGGTAAGTTAATATATGCTAAGCGGGATACCATAGCTTTCTGGGTGTTCGATCTGC', 'TGTCTTAGGGGGAGACTGTGCATCGTCGGTGAAGATCACATAGTGGTGGGTCCCCTGCAC', 'CAGCTCCTTTCTGAACTCGAGTTTTGGTTAGAGGAATGACCGGCGGGGAGTGGGCGTGTT', 'TGGATAGGTGCATGTTACAAGATATTACGAGGCGTCCATACTCGCCCAGATCGCTACGCA', 'TCTGCACATAGGCAAGGAACCCTCCTTGAGCGCGCATTTAAGGGCCTGTTGGGTTTGGCT', 'ACAAATCTACAAATCAATAGGATTGGCGAATCTTTACTGTAAGTAGAAGTTGACAAGGCC', 'CTTTGTTTCTCCACTGTATGGCTGAGACATAAACTATAAAATCCCGAAGCGTGCAGCCCT']
testdat = ['AGGTGCGTTGACGTCCACAGTCTAGGCAGCTGAATCGGACCCAGTTCAGCGAAAAACCTA', 'GTCACGCTTCCAGTTTTTTGATAGCCGGTGGGCCGTGTGGTGCGCAATGTGCGGCTCCTG', 'TCATCCAATGTTAGCACGTTACACGCGCGTCTCTCGCCTATCGTCTGTTTTCTCTAACCC', 'CGTACATGGTGCAGGAGCAGATCTTTGTGGCTTAGCCGTCTCCCGTTCGCCGGCCGCTAT', 'CCATGGCGGTCCAGTTATAACGTGCGCGCGTCCTGAGCAAGCTATGGTGTCACTAAGGAG', 'GCCTATTCATGGTAGATATTTCGAGTCCGGAAATCAGAATTTTGGCCCTGCAGTGGCTTA', 'AGCCCCCTCTTAATTGCAAGCTGGAGCTGTGATAAAAGTCAATGCAGGCGAGACCCCAGT', 'CATTACATTCGCTAAGTATGTCTATACCCGATCGACGTGGTAGCACCTAGTAAGAGGGTA', 'GATCCGGCCGCGAGAGATCTGGTCGGCCGTTCTTGTAATCGTCAGCCTGCGAGTTCATGG', 'TCCCTGATAAGATCAGCATATGTTCCGTGCCCACCCGGCCCATTGTGGTATAACGAGGGC', 'TTGCCGTCTATTTGGCAGGCCCTCGGATACGGACTATCTGAACAACCGAGAAAGTTATAC', 'CGCTATGCAATATGCGAACTGATGAGCATCTATCATGGCGTCGTCTGTCCATCACACAGG', 'GGCTAACGGTACGAACCTGTATATGTTCCCCGTTAGGTAAAGCATCCGATTTGATGTATG', 'ATTCCTACCTGGAACAAACGCTAAGGCCAGTCCTCTCAGCTCACTTGCTTGTTCTGAATG', 'ACCAATTGCACATGGAGGAACCGCTGTATGATGCGATCCATGAGCAACCAGGATCGCCGC', 'TATGATGACATTCTGCAATTCAATCCACGGCAACCCGAAGTACCCCAGCATCCGGTTTGC', 'CGCAGGCCACGCTGGACTAGACATGTGTGTGGCCTACACGGTCGAAAATTCAGTGCCTAT']
km_train = [1, 0.0482697427, 0.0402839397, 0.0281277728, 0.0333629104, 0.0315882875, 0.0417923691, 0.0314995563, 0.0176574978, 0.0366459627, 0.0297249335;0.0482697427, 1, 0.034960071, 0.0124223602, 0.0230700976, 0.0334516415, 0.0488021295, 0.0555456965, 0.0335403727, 0.0124223602, 0.028216504;0.0402839397, 0.034960071, 1, 0.0212067436, 0.0402839397, 0.0229813665, 0.0505767524, 0.0276841171, 0.0280390417, 0.0418811003, 0.050310559;0.0281277728, 0.0124223602, 0.0212067436, 1, 0.0124223602, 0.0228926353, 0.0298136646, 0.041703638, 0.0384205856, 0.034960071, 0.0212067436;0.0333629104, 0.0230700976, 0.0402839397, 0.0124223602, 1, 0.036823425, 0.0401952085, 0.0299911269, 0.0401064774, 0.050310559, 0.0470275067;0.0315882875, 0.0334516415, 0.0229813665, 0.0228926353, 0.036823425, 1, 0.043566992, 0.040461402, 0.0369121562, 0.0402839397, 0.0317657498;0.0417923691, 0.0488021295, 0.0505767524, 0.0298136646, 0.0401952085, 0.043566992, 1, 0.0317657498, 0.0333629104, 0.0281277728, 0.0335403727;0.0314995563, 0.0555456965, 0.0276841171, 0.041703638, 0.0299911269, 0.040461402, 0.0317657498, 1, 0.0452528838, 0.0385093168, 0.0386867791;0.0176574978, 0.0335403727, 0.0280390417, 0.0384205856, 0.0401064774, 0.0369121562, 0.0333629104, 0.0452528838, 1, 0.0332741792, 0.0333629104;0.0366459627, 0.0124223602, 0.0418811003, 0.034960071, 0.050310559, 0.0402839397, 0.0281277728, 0.0385093168, 0.0332741792, 1, 0.0467613132;0.0297249335, 0.028216504, 0.050310559, 0.0212067436, 0.0470275067, 0.0317657498, 0.0335403727, 0.0386867791, 0.0333629104, 0.0467613132, 1]
km_test = [0.0748890861, 0.0246672582, 0.050310559, 0.0385093168, 0.0334516415, 0.02635315, 0.028216504, 0.0367346939, 0.0247559894, 0.0583850932, 0.0384205856, 0.0316770186, 0.0419698314, 0.0298136646, 0.0314108252, 0.0264418811, 0.0624667258;0.0260869565, 0.0348713398, 0.0333629104, 0.0316770186, 0.0401952085, 0.0212954747, 0.0452528838, 0.0362910382, 0.0281277728, 0.0195208518, 0.0335403727, 0.0211180124, 0.0384205856, 0.0332741792, 0.0645962733, 0.0646850044, 0.0350488021;0.0483584738, 0.0313220941, 0.0246672582, 0.0318544809, 0.0370008873, 0.0331854481, 0.0697426797, 0.034960071, 0.0246672582, 0.0334516415, 0.0194321207, 0.0420585626, 0.0454303461, 0.0335403727, 0.036823425, 0.0281277728, 0.015971606;0.0331854481, 0.0331854481, 0.0230700976, 0.0299023957, 0.0332741792, 0.0264418811, 0.0264418811, 0.0247559894, 0.0334516415, 0.0350488021, 0.0350488021, 0.0246672582, 0.0443655723, 0.0264418811, 0.0262644188, 0.0485359361, 0.0314995563;0.034960071, 0.0265306122, 0.0230700976, 0.0245785271, 0.0516415262, 0.0574977817, 0.0314995563, 0.0537710736, 0.036823425, 0.0586512866, 0.0439219166, 0.0437444543, 0.0193433895, 0.0450754215, 0.0401952085, 0.0541259982, 0.0317657498;0.0195208518, 0.0246672582, 0.049068323, 0.0386867791, 0.0299023957, 0.034960071, 0.0415261757, 0.0401952085, 0.0482697427, 0.0370896185, 0.036823425, 0.0316770186, 0.0245785271, 0.0433895297, 0.0262644188, 0.0437444543, 0.0346938776;0.0362910382, 0.0365572316, 0.0124223602, 0.0385980479, 0.0246672582, 0.0195208518, 0.0455190772, 0.0523513753, 0.0177462289, 0.0385980479, 0.0367346939, 0.0195208518, 0.0468500444, 0.0177462289, 0.02635315, 0.0195208518, 0.0176574978;0.0574090506, 0.0433895297, 0.0418811003, 0.0386867791, 0.0362910382, 0.0264418811, 0.0212067436, 0.0331854481, 0.0403726708, 0.028216504, 0.0334516415, 0.0329192547, 0.0247559894, 0.0175687666, 0.0379769299, 0.0382431233, 0.0470275067;0.014108252, 0.0334516415, 0.0386867791, 0.0299023957, 0.0283052351, 0.0316770186, 0.028216504, 0.0401952085, 0.0314108252, 0.0350488021, 0.0547471162, 0.0106477374, 0.0418811003, 0.034960071, 0.0386867791, 0.0334516415, 0.0299023957;0.0454303461, 0.0299023957, 0.036823425, 0.0212067436, 0.063797693, 0.0194321207, 0.0468500444, 0.0334516415, 0.0394853594, 0.0384205856, 0.02635315, 0.0384205856, 0.02635315, 0.043566992, 0.0331854481, 0.0194321207, 0.0451641526;0.0467613132, 0.0335403727, 0.0212067436, 0.036823425, 0.0449866903, 0.0487133984, 0.0453416149, 0.0511978705, 0.036823425, 0.0193433895, 0.04418811, 0.0381543922, 0.0261756877, 0.0369121562, 0.0385093168, 0.0433895297, 0.0385093168]
functionname = 'test_wd_kernel'
kernelname = 'WeightedDegreeStringKernel'
alphabet= 'DNA' 
seqlen= 60 
degree= 20 
