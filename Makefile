GZIP = gzip

.PHONY: all
all : index.gzip.html htaccess

%.gzip.html %.gzip.css %.gzip.js : %.html
	$(GZIP) -cn9 $< > $@

.PHONY: clean
clean :
	rm *.gzip.html *.gzip.css *.gzip.js

.PHONY: htaccess
htaccess :
	if [ ! -f .htaccess ] || [ `grep -sc "Multiviews" .htaccess` = 0 ] ; then echo "Options +Multiviews" >> .htaccess; fi
