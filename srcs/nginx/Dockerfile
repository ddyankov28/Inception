# using the penultimate stable version of debian
FROM debian:bullseye

# update and upgrade the packages
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx openssl

# create a dir for the certficates
RUN mkdir -p /etc/nginx/certs

# generate certificate with openssl request
RUN openssl req -new -newkey rsa:4096 -x509 \
    -days 365 -nodes \
    -sha512 \
    -subj "/C=AT/L=VIE/O=42/CN=ddyankov.42.fr" \
    -out /etc/nginx/certs/nginx.crt \
    -keyout /etc/nginx/certs/nginx.key 

# copy the nginx conf file to the container
COPY ./nginx.conf /etc/nginx/conf.d

# redirect the logs 
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

# run in the foreground so that docker logs can use them, not run as a daemon so that the 
# container remains active and manageable while running
CMD [ "nginx", "-g", "daemon off;" ]
