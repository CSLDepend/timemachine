FROM ubuntu
MAINTAINER Phuong Cao <pcao3 at illinois dot edu>
RUN apt-get update && apt-get install -y debootstrap
ADD build_image.sh /usr/bin/
VOLUME /tmp/timemachine
ENTRYPOINT ["/usr/bin/build_image.sh"]
