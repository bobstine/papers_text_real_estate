#!/bin/bash

# copy cross-validation files built on hilbert to local machine

cd  ~/C/text/text_src/temp/ChicagoOld3
mkdir cv_15242; scp "bob@hilbert.wharton.upenn.edu:C/text/text_src/temp/ChicagoOld3/cv_15242/*" cv_15242/
mkdir cv_24387; scp "bob@hilbert.wharton.upenn.edu:C/text/text_src/temp/ChicagoOld3/cv_24387/*" cv_24387/
mkdir cv_31427; scp "bob@hilbert.wharton.upenn.edu:C/text/text_src/temp/ChicagoOld3/cv_31427/*" cv_31427/
mkdir cv_53853; scp "bob@hilbert.wharton.upenn.edu:C/text/text_src/temp/ChicagoOld3/cv_53853/*" cv_53853/
mkdir cv_73241; scp "bob@hilbert.wharton.upenn.edu:C/text/text_src/temp/ChicagoOld3/cv_73241/*" cv_73241/


