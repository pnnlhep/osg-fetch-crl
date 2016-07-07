FROM pnnlhep/osg-base
MAINTAINER Kevin Fox "Kevin.Fox@pnnl.gov"

ADD ./start.sh /etc/start.sh
RUN \
  yum install -y fetch-crl crontabs cronie-anacron osg-ca-certs perl-Crypt-SSLeay && \
  mv /etc/grid-security/certificates /etc/grid-security/certificates.orig && \
  touch /var/lock/subsys/fetch-crl-cron && \
  chmod +x /etc/start.sh && \
  sed -i 's/^\(.*pam_loginuid.so\)$/#\1/' /etc/pam.d/crond

CMD ["/etc/start.sh"]
