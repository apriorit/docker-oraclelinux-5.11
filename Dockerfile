# This docker file contains build environment
FROM oraclelinux:5.11
MAINTAINER sergey.sokolov <sergey.sokolov@apriorit.com>

RUN yum -y update && yum clean all
RUN yum -y install gcc

RUN cd /tmp/build/src/Unix/Hooks/

RUN gcc libc_hooks.c -o libHooks-1.0-SNAPSHOT.so -ldl -lpthread -I../../Common -I../LinuxCommon -std=c11 -g -O0 -fPIC -shared
