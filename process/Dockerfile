FROM httpd:2.4-alpine

RUN apk add --no-cache supervisor

COPY ./supervisord.conf /etc/supervisor.d/supervisord.ini
CMD ["supervisord", "-c", "/etc/supervisord.conf"]

# docker run -it mytest:latest
