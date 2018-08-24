##might need to do tr instead of sed depending on your server
sed 's/^/>/g' geneB.phy | sed 's/\t/\n/g' | sed 1d
