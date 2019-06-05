#!/bin/sh

#read INSTALL to learn how to prepare the source files (in this branch they are already prepared

#check for modifications in src/Makefile.am

#check for src/plugin-static.h

LIGHTTPD_STATIC=yes ./configure -C --enable-static=yes --disable-lfs --disable-ipv6 --without-libev --without-mysql --without-pgsql --without-dbi --without-sasl --without-ldap --without-pam --without-attr --without-valgrind --without-krb5 --without-openssl  --without-wolfssl --without-pcre --without-zlib --without-bzip2 --without-fam --without-webdav_props --without-libxml --without-sqlite --without-webdav_locks --without-gdbm --without-geoip --without-maxminddb --without-memcached --without-lua 

make

strip -o ./src/lighttpd-strip --strip-unneeded --strip-debug ./src/lighttpd
mv ./src/lighttpd ./src/lighttpd-dbg
mv ./src/lighttpd-strip ./src/lighttpd

sudo make install
