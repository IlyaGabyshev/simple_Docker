#!bin/bash

gcc miniserver.c -o miniserver -lfcgi
chmod 777 miniserver
spawn-fcgi -p 8080 ./miniserver
nginx -s reload
# Эта команда запускает Nginx в режиме, который не отсоединяет процесс 
# от терминала. Это может быть полезно при запуске Nginx внутри 
# контейнера Docker, чтобы он оставался активным и вы могли видеть его 
# вывод в терминале.
nginx -g "daemon off;"