FROM frolvlad/alpine-oraclejdk8:slim

RUN apk --update add curl tar bash

ENV SOLR_VERSION 6.0.0

RUN mkdir -p /opt/solr && \
curl https://dist.apache.org/repos/dist/release/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz | tar -xzC /opt/solr --strip=1

EXPOSE 8983

ENTRYPOINT ["/opt/solr/bin/solr", "-f"]
