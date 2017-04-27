#!/bin/bash

if [ ! -z $1 ]; then
  IMG_VERSION=":$1"
  shift
fi



docker build -t docker.precognox.com/alpine-solr$IMG_VERSION $* .
