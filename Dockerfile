FROM pnnlhep/osg-base
MAINTAINER Kevin Fox "Kevin.Fox@pnnl.gov"

RUN yum install -y fetch-crl crontabs cronie-anacron osg-ca-certs
RUN mv /etc/grid-security/certificates /etc/grid-security/certificates.orig
RUN touch /var/lock/subsys/fetch-crl-cron
ADD ./start.sh /etc/start.sh
RUN chmod +x /etc/start.sh
RUN sed -i 's/^\(.*pam_loginuid.so\)$/#\1/' /etc/pam.d/crond

CMD ["/etc/start.sh"]
