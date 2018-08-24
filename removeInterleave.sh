perl -pe '/^>/ ? print "\n" : chomp' in.fasta | tail -n +2 > out.fasta
