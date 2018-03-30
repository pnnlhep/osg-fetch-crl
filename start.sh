#!/bin/bash -e

if [ `ls /etc/grid-security/certificates/ | wc -l` -eq 0 ];
then
        mkdir -p /etc/grid-security/certificates/
	cp -a /etc/grid-security/certificates.orig/* /etc/grid-security/certificates/
else
        #clean out old ca's.
        #for x in 0a2bac92 28a58577 33eb0f86 524cae41 82b36fca BrGrid c7a3bf7e HellasGrid-CA-2006 HellasGrid-Root; do
        #        rm -f /etc/grid-security/certificates/$x.* || true
        #done

        #sync ca's.
        rsync -avzh /etc/grid-security/certificates.orig/ /etc/grid-security/certificates/
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
while true; do
  #Every 4 hours
  sleep 14400
  fetch-crl || true
done
