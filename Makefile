SUBDIRS =
DESTDIR =
UBINDIR ?= /usr/bin
LIBDIR ?= /usr/lib
SBINDIR ?= /sbin
USBINDIR ?= /usr/sbin
BINDIR ?= /bin
LIBEXECDIR ?= /usr/libexec
SYSCONFDIR ?= /etc

build:
	gcc try_dlopen.c -o try_dlopen -ldl

all: build install

clean: 
	rm try_dlopen

install: build
	install -d $(DESTDIR)/$(USBINDIR)
	install -m 0755 gentoo-builder $(DESTDIR)/$(USBINDIR)/
	install -m 0755 gentoo-localbuild $(DESTDIR)/$(USBINDIR)/

	install -d $(DESTDIR)/$(UBINDIR)
	install -m 0755 depcheck $(DESTDIR)/$(UBINDIR)/
	install -m 0755 dynlink-scan $(DESTDIR)/$(UBINDIR)/
	install -m 0755 try_dlopen $(DESTDIR)/$(UBINDIR)/
