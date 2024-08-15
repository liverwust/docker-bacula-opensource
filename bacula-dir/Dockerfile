FROM alpine:3.20.2

MAINTAINER "Louis Wust" <louiswust@fastmail.fm>
ENV BACULA_VERSION "13.0.3"
LABEL com.baculasystems.bacula.version="${BACULA_VERSION}" \
      us.wust.image.version="1.0.2"

ENV BACULA_COMPONENTS "bacula bacula-client bacula-libs bacula-pgsql"

RUN for b in ${BACULA_COMPONENTS}; do apk add $b; done

# Add and save a copy of the FD config file. We'll populate it first boot.
ADD bacula-fd/configs/bacula-fd.conf /root/bacula-fd.conf.orig
RUN rm -f /etc/bacula/bacula-fd.conf

# Add Bacula to path so running 'docker exec -ti ... bconsole' works
ENV PATH=$PATH:/usr/sbin

ADD bacula-dir/scripts/run.sh /

RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]

EXPOSE 9101
