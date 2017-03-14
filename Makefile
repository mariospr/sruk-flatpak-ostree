doc=20170316-SRUK-Flatpak-OSTree
SHELL=/bin/bash

default: redhat_logo.pdf pdfdirect

redhat_logo.pdf:
	wget -c https://upload.wikimedia.org/wikipedia/en/6/6c/RedHat.svg
	rsvg-convert -f pdf -o redhat_logo.pdf RedHat.svg

dvi:
	latex $(doc).tex;
	latex $(doc).tex;

ps:dvi
	dvips -o $(doc).ps $(doc).dvi;

pdf:ps
	ps2pdf $(doc).ps;

pdfdirect:
	pdflatex $(doc).tex;

clean:
	rm -f *.{out,aux,toc,log,bbl,blg,bak,snm,nav} *\~
	rm -f redhat_logo.pdf RedHat.svg

mrproper: clean
	rm -f *.{ps,dvi,pdf,vrb}

