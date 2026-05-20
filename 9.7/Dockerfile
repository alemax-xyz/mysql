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

FROM library/debian:stable-slim AS build

ENV LANG=C.UTF-8 \
    SANDBOX_ROOT=/

RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y wget openssl ca-certificates

ADD https://github.com/alemax-xyz/misc-tools.git#main /usr/local/bin/

RUN mkdir -p /build /rootfs

WORKDIR /build

COPY build/ .

COPY --from=clover/common:latest /var/lib/packages/ var/lib/packages/

RUN apt-sandbox --install --verstamp \
        --apt-config \
            APT::Install-Recommends=false \
            APT::Get::Upgrade==false \
        --repository . \
        --keyring . \
        --installed var/lib/packages \
        --obsolete packages.obsolete \
        --required packages.required

WORKDIR /rootfs

RUN rm -rf \
        etc/mysql \
        etc/mecabrc \
        usr/bin/mysqld_multi \
        usr/bin/mysqld_safe \
        usr/bin/mysqldumpslow \
        usr/lib/systemd \
        usr/lib/tmpfiles.d \
        usr/share/doc \
        usr/share/lintian \
        usr/share/man \
        usr/share/mysql-9.7/charsets/README \
        usr/share/mysql-9.7/docs \
        usr/share/mysql-9.7/*.sql \
        usr/share/mysql-9.7/*.txt \
        usr/share/mysql-9.7/mysql* \
 && sed -i -r \
        -e 's,^[[:space:]]*[#;]+.*$,,g' \
        -e 's,[[:space:]]+, ,g' \
        -e '/^[[:space:]]*$/d' \
        etc/netconfig \
 && mkdir -p \
        run/mysqld \
        var/lib/mysql \
        var/lib/mysql-files \
 && chmod 0770 var/lib/mysql-files

COPY --from=base /etc/group /etc/gshadow /etc/passwd /etc/shadow etc/
COPY rootfs/ .

FROM clover/common

WORKDIR /

COPY --from=build /rootfs /

EXPOSE 3306
