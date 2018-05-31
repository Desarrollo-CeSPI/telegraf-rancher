# Rancher Telegraf integration

This image collect data for each node of your cattle environment and send it
to specified influx host. Remember that you need to mount some local volumes 
needed by telegraf inputs that must read data from real host and not containers.

## Example docker-compose

```yml
version: '2'
services:
  telegraf:
    image: mikroways/telegraf-rancher:1.0
    environment:
      INFLUXDB_HOST: https://influx.example.net
      INFLUXDB_NAME: telegraf
      INFLUXDB_PASSWORD: pass
      INFLUXDB_USER: telegraf
    volumes:
    - /var/run/docker.sock:/var/run/docker.sock:ro
    - /sys:/rootfs/sys:ro
    - /proc:/rootfs/proc:ro
    - /etc:/rootfs/etc:ro
    - /:/hostfs:ro
    - /var/run/utmp:/var/run/utmp:ro
    labels:
      io.rancher.container.start_once: 'true'
      io.rancher.scheduler.global: 'true'
```
