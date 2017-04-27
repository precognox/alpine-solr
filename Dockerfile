FROM frolvlad/alpine-oraclejdk8:slim

RUN apk --update add curl tar bash wget libstdc++ && rm -rf /var/cache/apk/*


ENV SOLR_USER solr
ENV SOLR_VERSION 6.4.0
ENV SOLR_DATA_DIR /opt/solr/data

RUN adduser -D $SOLR_USER

RUN mkdir -p /opt/solr && \
curl https://dist.apache.org/repos/dist/release/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz | tar -xzC /opt/solr --strip=1 && \
chown $SOLR_USER /opt/solr -R

RUN mkdir -p $SOLR_DATA_DIR
VOLUME $SOLR_DATA_DIR

COPY entrypoint.sh /

#USER solr


EXPOSE 8983

#ENTRYPOINT ["/opt/solr/bin/solr", "-f"]
ENTRYPOINT ["/entrypoint.sh"]
