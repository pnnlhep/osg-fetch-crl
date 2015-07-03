#!/bin/bash -e

if [ ! -d /etc/grid-security/certificates ];
then
	cp -a /etc/grid-security/certificates.orig/* /etc/grid-security/certificates/
fi
fetch-crl
/usr/sbin/crond -n
