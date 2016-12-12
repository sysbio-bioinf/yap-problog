Dockerfile to build Problog docker image.
Built from Problog version 1 packed into YAP (YAP version 6.3.0 is used).
This version requires CUDD. CUDD's Makefile is edited to work with Ubuntu Precise.

To run this image:
$ docker run --rm -ti sysbiobioinf/yap-problog

To run yap:
$ yap

To consult problog within yap:
$ :-use_module(library(problog)).

To run a yap-problog program, e.g. 'simple.pl':
$ yap -l simple.pl
