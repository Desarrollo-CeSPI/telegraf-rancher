FROM cespi/telegraf:1.11-alpine
RUN apk add -U curl
COPY entrypoint.sh /entrypoint.sh
COPY telegraf.conf /etc/telegraf/
