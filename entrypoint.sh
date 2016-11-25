#!/bin/bash

chown $SOLR_USER $SOLR_DATA_DIR -R
su  -c "/opt/solr/bin/solr -f $*" $SOLR_USER
