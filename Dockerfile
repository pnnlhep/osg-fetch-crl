FROM kfox1111/osg-base
MAINTAINER Kevin Fox "Kevin.Fox@pnnl.gov"

RUN yum install -y fetch-crl crontabs cronie-anacron osg-ca-certs
RUN mv /etc/grid-security/certificates /etc/grid-security/certificates.orig
RUN touch /var/lock/subsys/fetch-crl-cron
ADD ./start.sh /etc/start.sh
RUN chmod +x /etc/start.sh

CMD ["/etc/start.sh"]
