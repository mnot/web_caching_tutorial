GZIP = gzip

.PHONY: all
all : index.gz.html htaccess

%.gz.html %.gz.css %.gz.js : %.html
	$(GZIP) -cn9 $< > $@

.PHONY: clean
clean :
	rm *.gz.html *.gz.css *.gz.js

.PHONY: htaccess
htaccess :
	if [ ! -f .htaccess ] || [ `grep -sc "Multiviews" .htaccess` = 0 ] ; then echo "Options +Multiviews" >> .htaccess; fi
