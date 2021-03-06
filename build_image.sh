#!/usr/bin/env bash

# default variables
tmp_dir=/tmp/timemachine
default_distribution=jessie
default_datetime=20151231
# validating number of inputs
if [ "$#" -ne 2 ]; then
    echo "Example usage: docker run -t --rm --privileged -v $tmp_dir/:$tmp_dir/ csldepend/timemachine $default_distribution $default_datetime"
    exit 1
fi
distribution=$1
datetime=$2

# create image using debootstrap
cd $tmp_dir && \
debootstrap $distribution ${distribution}-${datetime} http://snapshot.debian.org/archive/debian/${datetime}T000000Z/ && \
cd ${distribution}-${datetime} && tar cvf ${distribution}-${datetime}.tar * && \
mv ${distribution}-${datetime}.tar .. && \
echo "Image created! Import by: docker import $tmp_dir/${distribution}-${datetime}.tar ${distribution}:${datetime}"
