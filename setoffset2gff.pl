=comm
AUTHOR: R.PRADEEP
INSTITUTE: ICRISAT
USAGE: perl ParsePedMap4PairwiseSNPMatrix.pl SNP.plink.ped SNP.plink.map group.txt

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
super_104       321637
super_1046      395261
super_1049      401028
super_105       407367
super_1053      461151
super_1055      466860
super_1058      472554
super_1062      478244
super_1068      483884
super_107       489600

=cut


my $gff=$ARGV[0];
my $offset=$ARGV[1];

print "$gff $offset\n";

open($off_fh,'<',$offset);

my %ofset=();
while(my $line=<$off_fh>){
	next if(/^#/);
	chomp($line);
	#print "$line\n";
	my @ele=split("\t",$line);
	$ofset{$ele[0]}=$ele[1];
}
#print "finished parsing\n";

open(my $gff_fh,'<',$gff);

while(my $line=<$gff_fh>){
	next if(/^#/);
	#	print "$line";
	chomp($line);
	my @ele=split("\t",$line);
	if(exists $ofset{$ele[0]}){
		my $snewpos=$ofset{$ele[0]}+$ele[3];
		my $enewpos=$ofset{$ele[0]}+$ele[4];
		#print "$ele[0]\t$ele[1]\t$newpos\n";
		$ele[3]=$snewpos;
		$ele[4]=$enewpos;
        if($ele[0]=~/^ExtraContig/){$ele[0]="Extracontigs";}
        if($ele[0] =~ /^super/){$ele[0]="Scaffolds";}	
		print join("\t",@ele),"\n";

	}else{
        print "$line\n"; 
    }
}





