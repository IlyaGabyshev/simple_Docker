
FROM nginx
WORKDIR /home/

COPY nginx.conf /etc/nginx/nginx.conf

COPY miniserver.c /home/miniserver.c

COPY build.sh /home/build.sh

RUN apt-get update
RUN apt-get install -y gcc libfcgi-dev spawn-fcgi


ENTRYPOINT ["bash", "./build.sh"]