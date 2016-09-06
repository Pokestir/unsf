CC=gcc
AS=as
AR=ar
RANLIB=ranlib

CFLAGS =-Wall -std=gnu99 -g -O2
CFLAGS_LIB =-DUNSF_BUILD=1
#CFLAGS_LIB+=-fPIC -DPIC
# symbol visibility:
#CFLAGS_LIB+=-DSYM_VISIBILITY -fvisibility=hidden
ARFLAGS=crv

all:	unsf

unsf: unsf.o libunsf.a
	$(CC) -o unsf unsf.o -L. -lunsf -lm

libunsf.a: libunsf.o
	$(AR) $(ARFLAGS) libunsf.a libunsf.o
	$(RANLIB) libunsf.a

unsf.o: unsf.c
	$(CC) $(CFLAGS) -o unsf.o -c unsf.c
libunsf.o: libunsf.c
	$(CC) $(CFLAGS) $(CFLAGS_LIB) -o libunsf.o -c libunsf.c

install: unsf
	install unsf $(DESTDIR)/usr/bin/
uninstall:
	rm -f $(DESTDIR)$/usr/bin/unsf

clean:
	$(RM) *.o *.a *.dll *.dylib *.exe unsf
