#!/bin/bash

chown -R $SOLR_USER $SOLR_DATA_DIR
su  -c "/opt/solr/bin/solr -f $*" $SOLR_USER
