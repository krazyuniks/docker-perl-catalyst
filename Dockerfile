ARG PERL_DOCKER_TAG

FROM perl:$PERL_DOCKER_TAG

ARG CPAN_MODULES

RUN apt -y update && \
    apt -y dist-upgrade && \
    apt -y install build-essential libtool libpng-dev libgif-dev libjpeg-dev libtiff-dev libfreetype6-dev libssl-dev libexpat-dev libzip-dev libgd-dev libxml2-dev libdb-dev libyaml-dev libxslt-dev libcurl4-openssl-dev libmcrypt-dev libpcre3-dev zlib1g-dev libjson-c-dev libgmp-dev libmariadb-dev-compat libmariadb-dev curl jq && \
    curl -fsSL https://raw.githubusercontent.com/skaji/cpm/main/cpm | perl - install -g App::cpm

RUN cpm install --show-build-log-on-failure --global $CPAN_MODULES

RUN apt -y purge --auto-remove build-essential libtool && \
    apt clean && \
    rm -rf /var/lib/apt /var/lib/dpkg /usr/share/doc/ /usr/share/man* /usr/share/locale* /usr/share/perl /root/.cpanm /root/.cpan /root/.perl-cpm
