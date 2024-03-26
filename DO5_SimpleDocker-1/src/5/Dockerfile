FROM nginx:latest
WORKDIR /server
USER root
RUN apt update && apt install -y libfcgi-dev spawn-fcgi gcc && rm -rf /var/lib/apt/lists/*
COPY fcgi.c /server/
COPY start.sh /server/
COPY nginx.conf /etc/nginx/nginx.conf
USER nginx
EXPOSE 8080
CMD ["bash", "start.sh"]