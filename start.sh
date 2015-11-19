#!/bin/bash -e

if [ `ls /etc/grid-security/certificates/ | wc -l` -eq 0 ];
then
        mkdir -p /etc/grid-security/certificates/
	cp -a /etc/grid-security/certificates.orig/* /etc/grid-security/certificates/
fi
if [ "x$SKIP_INIT" == "x" ]; then
	fetch-crl
fi
/usr/sbin/crond -n
