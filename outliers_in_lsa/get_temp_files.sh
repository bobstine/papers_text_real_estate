#!/bin/bash

# copy files built on hilbert in "temp" to local machine

# I use a symbolic link to data dir, but had trouble with the version that came from git
# need directory  mkdir -p ~/C/text/text_src/temp/
# need dir        mkdir -p ~/C/text/text_src/temp/ChicagoOld3/

scp bob@hilbert.wharton.upenn.edu:C/text/text_src/temp/ChicagoOld3.txt ~/C/text/text_src/temp/

cd  ~/C/text/text_src/temp/
scp bob@hilbert.wharton.upenn.edu:C/text/text_src/temp/ChicagoOld3/parsed.txt .
scp bob@hilbert.wharton.upenn.edu:C/text/text_src/temp/ChicagoOld3/logtoken_poly_5.txt .
scp bob@hilbert.wharton.upenn.edu:C/text/text_src/temp/ChicagoOld3/lsa_ym.txt .
scp bob@hilbert.wharton.upenn.edu:C/text/text_src/temp/ChicagoOld3/lsa_cca_500_p4_d.txt .
scp bob@hilbert.wharton.upenn.edu:C/text/text_src/temp/ChicagoOld3/lsa_cca_500_p4_u.txt .
scp bob@hilbert.wharton.upenn.edu:C/text/text_src/temp/ChicagoOld3/lsa_cca_500_p4_v.txt .
scp bob@hilbert.wharton.upenn.edu:C/text/text_src/temp/ChicagoOld3/types_5704.txt .
scp bob@hilbert.wharton.upenn.edu:C/text/text_src/temp/ChicagoOld3/w5704.txt .

