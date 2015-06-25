FROM kfox1111/osg-base
MAINTAINER Kevin Fox "Kevin.Fox@pnnl.gov"

RUN yum install -y fetch-crl crontabs cronie-anacron
RUN touch /var/lock/subsys/fetch-crl-cron
ADD ./start.sh /etc/start.sh
RUN chmod +x /etc/start.sh

CMD ["/etc/start.sh"]
