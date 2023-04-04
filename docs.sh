#!/usr/bin/env zsh

rm GlimmerOS-*
rm -rf ./documents
doxygen Doxyfile
cd ./documents/latex
sed 's/{min}/{gkai}/g' refman.tex > .refman.tex
mv .refman.tex refman.tex
make 
cp refman.pdf ../../GlimmerOS-$(date +%y-%m-%d).pdf
cd ../..
