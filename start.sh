#!/bin/bash -e

if [ `ls /etc/grid-security/certificates/ | wc -l` -eq 0 ];
then
        mkdir -p /etc/grid-security/certificates/
	cp -a /etc/grid-security/certificates.orig/* /etc/grid-security/certificates/
fi
if [ "x$SKIP_INIT" == "x" ]; then
	#fetch-crl fails if any CA fails to refresh... It seems normal operation for one to fail. :/
	if [ "x$FAIL_ON_FETCH_CRL_FAIL" != "x" ]; then
		fetch-crl
	else	
		fetch-crl || true
	fi
fi
touch /etc/grid-security/certificates/.fetch_crl_inited
/usr/sbin/crond -n
