FROM nginx:latest
WORKDIR /server
RUN apt update && apt install -y libfcgi-dev spawn-fcgi gcc
COPY fcgi.c /server/
COPY start.sh /server/
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 8080
CMD ["bash", "start.sh"]