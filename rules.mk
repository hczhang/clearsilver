##
## Global Makefile Rules
##
## Before including this file, you must set NEOTONIC_ROOT
##

OSNAME := $(shell uname -rs | cut -f 1-2 -d "." | cut -f 1 -d "-")

LIB_DIR    = $(NEOTONIC_ROOT)libs/

## Programs
MKDIR      = mkdir -p
RM         = rm -f
FLEX       = flex
CC         = gcc
CFLAGS     = -g -O2 -Wall -c -I$(NEOTONIC_ROOT) -I$(HOME)/src/db-2.7.7/dist -I/neo/opt/include -I/neo/opt/include/python2.1
OUTPUT_OPTION = -o $@
LD         = $(CC) -o
LDFLAGS    = -L$(LIB_DIR)
LDSHARED   = $(CC) -shared -fPic
AR         = $(MKDIR) $(LIB_DIR); ar -cr
DEP_LIBS   = $(DLIBS:-l%=$(LIB_DIR)lib%.a)


.c.o:
	$(CC) $(CFLAGS) $(OUTPUT_OPTION) $<

LIBS = -lz

everything: depend all

.PHONY: depend
depend: Makefile.depends

Makefile.depends:
	@echo "*******************************************"
	@echo "** Building Dependencies "
	@rm -f Makefile.depends
	@touch Makefile.depends
	@for II in `/bin/ls -1 *.c`; do \
		gcc -M -MG ${CFLAGS} $$II >> Makefile.depends; \
	done;

DEPEND_FILE := $(shell find . -name Makefile.depends -print)
ifneq ($(DEPEND_FILE),)
include Makefile.depends
endif
