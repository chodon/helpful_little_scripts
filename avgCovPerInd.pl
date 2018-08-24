use File::Slurp 'read_file';

my $genesFile = '/clusterfs/vector/scratch/chodon/toChodonVector/muac.shlim.list';
my $out = '/clusterfs/vector/scratch/chodon/toChodonVector/CovPerInd.txt';
my $outgroupList = '/clusterfs/vector/scratch/chodon/toChodonVector/OutLib.list2';


open(OUT,">$out");

my @genes = read_file $genesFile;
my @lib = read_file $outgroupList;

foreach my $genes(@genes){
    chomp $genes;

foreach my $lib(@lib){    
    chomp $lib;
    #this will print average coverage to the screen
    my $covFile = '/clusterfs/vector/scratch/chodon/toChodonVector/' . $lib . '/map2/contigs2/' . $lib . '_m2n240_4.cov';
    my $avgCov = `grep $genes $covFile | awk \'{sum+=\$3}END{print sum/NR}\'`;
    chomp $avgCov;
    print OUT "$genes\t$lib\t$avgCov\n";
}
}
close OUT;
