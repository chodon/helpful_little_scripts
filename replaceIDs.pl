#!/usr/bin/perl
use strict;
use warnings;
use Bio::SeqIO;

my %lookup;
open my $fh, "<", 'InputNames.txt' or die $!;

while (<$fh>) {
    chomp;
    my ($id, $replace) = split /\t/;
    $lookup{$id} = $replace;
}
close $fh or die $!;

my $in  = Bio::SeqIO->new( -file   => "muac.baits.fa" ,
                           -format => 'fasta');
my $out = Bio::SeqIO->new( -file   => '>muac.shbaits.fa',
                           -format => 'fasta');

while ( my $seq = $in->next_seq() ) {
    if (defined(my $replace = $lookup{ $seq->id })) {
        $seq->display_id($replace);
    }
    $out->write_seq($seq);
}

__END__
