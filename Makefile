#!/usr/bin/make
# vim: tabstop=4 softtabstop=4 noexpandtab fileencoding=utf-8

DIRS:= src

all:
	for d in $(DIRS); do (cd $$d; $(MAKE) $(MFLAGS)); done;

clean:
	for d in $(DIRS); do (cd $$d; $(MAKE) clean); done;
	rm -rf debian/apt-transport-s3*

deb:
	sed -i 's/debian/ubuntu/g' ./debian/changelog
	dpkg-buildpackage -us -uc

deb_debian:
	sed -i 's/ubuntu/debian/g' ./debian/changelog
	dpkg-buildpackage -us -uc