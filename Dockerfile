FROM ubuntu
RUN apt-get update && apt-get install -y debootstrap
ADD build_image.sh /usr/bin/
ENTRYPOINT ["/usr/bin/build_image.sh"]