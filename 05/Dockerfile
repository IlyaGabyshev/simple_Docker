FROM nginx:latest

WORKDIR /home/

COPY nginx.conf /etc/nginx/nginx.conf
COPY miniserver.c /home/miniserver.c
COPY build.sh /home/build.sh

RUN apt-get update && \
    apt-get install -y gcc libfcgi-dev spawn-fcgi && \
    chmod +x /home/build.sh && \
    rm -rf /var/lib/apt/lists

RUN chmod 755 /usr/bin/chage && \
    chmod 755 /usr/bin/passwd && \
    chmod 755 /usr/bin/chsh && \
    chmod 755 /usr/bin/su && \
    chmod 755 /usr/bin/gpasswd && \
    chmod 755 /usr/bin/wall && \
    chmod 755 /usr/bin/newgrp && \
    chmod 755 /usr/sbin/unix_chkpwd && \
    chmod 755 /usr/bin/mount && \
    chmod 755 /usr/bin/chfn && \
    chmod 755 /usr/bin/umount && \
    chmod 755 /usr/bin/expiry


RUN touch /var/run/nginx.pid && chown nginx:nginx /var/run/nginx.pid
    
RUN   chown -R nginx:nginx /etc/nginx && \
      chown -R nginx:nginx /home && \
      chown -R nginx:nginx /bin && \
      chown -R nginx:nginx /sbin && \
      chown -R nginx:nginx /var && \
      chown -R nginx:nginx /etc/nginx/nginx.conf

USER nginx

HEALTHCHECK --interval=5m --timeout=3s CMD curl http://localhost/ || exit 1

ENTRYPOINT ["bash", "./build.sh"]
