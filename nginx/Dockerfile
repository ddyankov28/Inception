FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/certs

RUN openssl req -new -newkey rsa:4096 -x509 \
    -days 365 -nodes \
    -sha512 \
    -subj "/C=AT/L=VIE/O=42/CN=ddyankov.42.fr" \
    -out /etc/nginx/certs/nginx.crt \
    -keyout /etc/nginx/certs/nginx.key 

COPY ./nginx.conf /etc/nginx/conf.d

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]