FROM centos:7

RUN yum -y install mkisofs genisoimage perl wget syslinux

VOLUME /data

COPY mkksiso .
