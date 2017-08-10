FROM docker.precognox.com/alpine-oraclejdk:3.5-8u121-slim

RUN apk --update add curl tar bash wget libstdc++ && rm -rf /var/cache/apk/*


ENV SOLR_USER solr
ENV SOLR_VERSION 6.6.0
ENV SOLR_DATA_DIR /opt/solr/data

RUN adduser -D $SOLR_USER

RUN mkdir -p /opt/solr && \
curl https://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz | tar -xzC /opt/solr --strip=1 && \
chown $SOLR_USER /opt/solr -R

RUN mkdir -p $SOLR_DATA_DIR
VOLUME $SOLR_DATA_DIR

COPY entrypoint.sh /

#USER solr


EXPOSE 8983

#ENTRYPOINT ["/opt/solr/bin/solr", "-f"]
ENTRYPOINT ["/entrypoint.sh"]
