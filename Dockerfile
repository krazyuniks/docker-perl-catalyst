FROM --platform=amd64 cgr.dev/chainguard/wolfi-base

COPY install_cpan_modules.sh .
COPY cpan_modules.txt .

RUN apk update && \
    apk upgrade && \
    apk add --force-overwrite bash wget perl perl-dev build-base libtool libpng-dev giflib-dev libjpeg-turbo-dev tiff-dev freetype-dev openssl openssl-dev expat-dev libzip gd-dev libxml2-dev db-dev yaml-dev libxslt-dev curl-dev libmcrypt pcre-dev zlib-dev json-c-dev gmp-dev mariadb-dev mariadb-connector-c-dev curl && \
    curl -L https://cpanmin.us | perl - App::cpanminus && \
    cpanm -n App::cpanoutdated && \
    curl -fsSL https://raw.githubusercontent.com/skaji/cpm/main/cpm | perl - install -g App::cpm && \
    cpan-outdated -p | xargs cpm install && \
    bash ./install_cpan_modules.sh && \
    apk del perl-dev build-base libtool libpng-dev giflib-dev libjpeg-turbo-dev tiff-dev freetype-dev openssl openssl-dev expat-dev gd-dev libxml2-dev db-dev yaml-dev libxslt-dev curl-dev pcre-dev zlib-dev json-c-dev gmp-dev mariadb-dev mariadb && \
    rm -rf /usr/share/{info,gtk-doc,doc,man,apk} /usr/local/share/{doc,man} /var/cache /root/.c* /root/.p*
