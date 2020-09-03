# Setoffset2gff
The script will parse the gff/gtf file along with offset file to set the offset position in given gff/gtf.

# Note
For offset file start position is enough to parse and reset the position.

USAGE: perl setoffset2gff.pl SorghumPangenomeGenes.gtf scafoldOfset.txt >out.gtf

# scafoldOfset.txt
#Scaffold	Off-Pos

super_100       1

super_1009      81427

super_101       87480

super_1015      145565

super_102       151738

super_1023      216776

super_1028      222679

super_103       228562

super_1031      309915

super_1032      315786

# Output
Standard output gff
