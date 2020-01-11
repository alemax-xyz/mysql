FROM clover/base AS base

RUN groupadd \
        --gid 50 \
        --system \
        mysql \
 && useradd \
        --home-dir /var/lib/mysql \
        --no-create-home \
        --system \
        --shell /bin/false \
        --uid 50 \
        --gid 50 \
        mysql

FROM library/ubuntu:bionic AS build

ENV LANG=C.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y \
        software-properties-common \
        apt-utils

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get install -y \
        wget

RUN mkdir -p /build/image
WORKDIR /build
RUN apt-get download \
        libedit2 \
        libbsd0 \
        libtinfo5 \
        libaio1 \
        liblz4-1 \
        libmysqlclient20 \
        libnuma1 \
        libstdc++6 \
        libwrap0 \
        netbase \
        ncurses-base \
        libdbi-perl \
        libdbd-mysql-perl \
        libterm-readkey-perl \
        mysql-client-5.7 \
        mysql-client-core-5.7 \
        mysql-common \
        mysql-server-5.7 \
        mysql-server-core-5.7
RUN for file in *.deb; do dpkg-deb -x ${file} image/; done

WORKDIR /build/image
RUN rm -rf \
        etc/apparmor.d \
        etc/init \
        etc/init.d \
        etc/logcheck \
        etc/logrotate.d \
        etc/mysql/* \
        etc/terminfo/README \
        lib/systemd \
        usr/bin/innotop \
        usr/bin/mysqld_multi \
        usr/bin/dh_perl_dbi \
        usr/share/apport \
        usr/share/doc \
        usr/share/gcc-5 \
        usr/share/gdb \
        usr/share/lintian \
        usr/share/libdbi-perl \
        usr/share/man \
        usr/share/mysql/docs \
        usr/share/mysql/*.sql \
        usr/share/mysql/*.txt \
        usr/share/mysql/echo_stderr \
        usr/share/mysql/magic \
        usr/share/mysql/mysql-log-rotate \
        usr/share/mysql/mysql-systemd-start \
        usr/share/mysql/mysqld_multi.server \
        usr/share/mysql-common \
        usr/share/perl5 && \
    wget -nv https://raw.githubusercontent.com/innotop/innotop/master/innotop -O usr/bin/innotop && \
    chmod a+x usr/bin/innotop && \
    mkdir -p \
        etc/mysql/conf.d \
        run/mysqld \
        var/lib/mysql \
        var/lib/mysql-files && \
    chmod 0770 var/lib/mysql-files

COPY --from=base /etc/group /etc/gshadow /etc/passwd /etc/shadow etc/
COPY my.cnf etc/mysql/
COPY conf.d/ etc/mysql/conf.d/
COPY init/ etc/init/
COPY init.sql usr/share/mysql/


FROM clover/perl

WORKDIR /
COPY --from=build /build/image /

VOLUME ["/var/lib/mysql"]

EXPOSE 3306
