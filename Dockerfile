FROM rightctrl/centos
MAINTAINER RightCtrl <AI@RightCtrl.com>

# Install prepare infrastructure
RUN yum -y update && \
        yum -y install wget && \
        yum -y install tar
RUN yum -y install gcc gcc-c++ make flex bison gperf ruby \
openssl-devel freetype-devel fontconfig-devel libicu-devel sqlite-devel \
libpng-devel libjpeg-devel
RUN rpm -Uvh https://rpm.nodesource.com/pub_4.x/el/7/x86_64/nodesource-release-el7-1.noarch.rpm

#added fonts
RUN yum -y install google-*fonts
RUN yum -y -q reinstall glibc-common && locale -a
# Prepare environment
ENV JAVA_HOME /opt/java
ENV PATH $PATH:$JAVA_HOME/bin

# Install Oracle Java8
RUN wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz

RUN tar xzf jdk-8u151-linux-x64.tar.gz
RUN rm jdk*.tar.gz
RUN mv jdk* ${JAVA_HOME}
