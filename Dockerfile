FROM nginx:stable-alpine

LABEL maintainer="me@hukumraj-singh-deora.party"

# Copy SSL Certificates
COPY resources/certificates/cloudflare_ssl_certificate.crt /etc/ssl/cloudflare_ssl_certificate.crt
COPY resources/certificates/cloudflare_ssl_certificate_key.key /etc/ssl/cloudflare_ssl_certificate_key.key

# Copy Nginx Configs
COPY resources/conf/nginx.conf /etc/nginx/nginx.conf
COPY resources/conf/mime.types /etc/nginx/mime.types

# Install Python/pip
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

# Install Dependencies
COPY requirements.txt /requirements.txt
RUN pip3 install -r requirements.txt

# Copy Django Project
COPY resources/conf/mime.types /etc/nginx/mime.types

EXPOSE 80
EXPOSE 443