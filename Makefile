#!/usr/bin/make

## VARIABLES
DESTDIR=/usr/local/bin/
DESTEXECUTABLE=aws-get-bill
EXECUTABLE=bin/aws-get-bill.pl
PERL=$$(which perl)
COMPRESS=tar czf
UNCOMPRESS=tar xzf
TESTDIR=./t/
TIDYING=perltidy -b

## TARGETS
all:
	@echo "No build required, choose a target motherfucker !"

install-requirements:
	@cpanm Paws DateTime

install-test-requirements:
	@cpanm Test::More

test:
	@prove -lr $(TESTDIR)

install:
	@sudo cp $(EXECUTABLE) $(DESTDIR)$(DESTEXECUTABLE)

tidy:
	@$(TIDYING) $(EXECUTABLE)
	@find $(TESTDIR) -name \*.t -exec $(TIDYING) {} \;
	@find . -name \*.bak -exec rm -f {} \;