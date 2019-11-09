FROM alpine:latest
MAINTAINER Web Xdata "docker@webxdata.com"

RUN apk add --no-cache squid apache2-utils
RUN set -x \
  && apk add --no-cache squid curl apache2-utils \
  && apk del curl

COPY squid.conf /etc/squid/

EXPOSE 3128

ENTRYPOINT ["/usr/sbin/squid"]
CMD ["-NYCd", "1"]

