GZIP = gzip
BROTLI = brotli

.PHONY: all
all : index.html.gzip index.html.brotli index.fr.html.gzip index.fr.html.brotli

%.html.gzip : %.html
	$(GZIP) -cn9 $< > $@

%.html.brotli : %.html
	$(BROTLI) --force --input $< --output $@
	chmod a+r $@

.PHONY: clean
clean :
	rm *.gzip.html *.gzip.css *.gzip.js

