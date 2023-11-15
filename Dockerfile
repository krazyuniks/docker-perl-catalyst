FROM --platform=amd64 cgr.dev/chainguard/wolfi-base as builder

RUN apk update && \
    apk upgrade && \
    apk add --force-overwrite bash perl perl-dev build-base libtool libpng-dev giflib-dev libjpeg-turbo-dev tiff-dev freetype-dev openssl openssl-dev expat-dev libzip gd-dev libxml2-dev db-dev yaml-dev libxslt-dev curl-dev libmcrypt pcre-dev zlib-dev json-c-dev gmp-dev mariadb-dev mariadb-connector-c-dev curl && \
    curl -fsSL https://raw.githubusercontent.com/skaji/cpm/main/cpm | perl - install -g App::cpm

ARG CPAN_MODULES
RUN cpm install --show-build-log-on-failure --global $CPAN_MODULES

FROM --platform=amd64 cgr.dev/chainguard/wolfi-base

RUN apk update && \
    apk upgrade && \
    apk add perl libpng giflib libjpeg-turbo libzip libxml2 libxslt libmcrypt zlib mariadb-connector-c bash && \
    rm -rf /usr/share/{info,gtk-doc,doc,apk} /var/cache

COPY --from=builder /usr/local/share/perl5 /usr/local/share/perl5
COPY --from=builder /usr/local/lib/perl5 /usr/local/lib/perl5
