# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM centos:centos7
MAINTAINER bernard@deprez.biz

RUN yum -y update &&\
    yum clean all

RUN yum -y install httpd sendmail php php-mysql php-gd php-ldap php-mbstring curl openssl psmisc tar &&\
    yum clean all

ADD scripts /scripts
ADD fix-permissions.sh ./

RUN ./fix-permissions.sh /var/www/html/

RUN chmod 755 /scripts/*

EXPOSE 80
CMD ["/bin/bash", "/scripts/start.sh"]
