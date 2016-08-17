unsf:
	cc -Wall -std=c11 -g -O0 -c libunsf.c
	ar -cvq libunsf.a libunsf.o
	cc -g -O0 -o unsf unsf.c -L. -lunsf -lm
install: unsf
	install unsf $(DESTDIR)/usr/bin/
uninstall:
	rm -f $(DESTDIR)$/usr/bin/unsf
clean:
	rm -f unsf libunsf.o libunsf.a
all:	unsf
