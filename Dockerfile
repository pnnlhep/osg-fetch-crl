FROM centos:centos7
MAINTAINER Kevin Fox "Kevin.Fox@pnnl.gov"

ADD ./start.sh /etc/start.sh
RUN \
  set -e; \
  yum install -y epel-release; \
  yum install -y http://repo.opensciencegrid.org/osg/3.4/osg-3.4-el7-release-latest.rpm; \
  yum clean all; \
  yum install -y fetch-crl osg-ca-certs cilogon-openid-ca-cert perl-Crypt-SSLeay rsync && \
  mv /etc/grid-security/certificates /etc/grid-security/certificates.orig && \
  chmod +x /etc/start.sh

CMD ["/etc/start.sh"]
