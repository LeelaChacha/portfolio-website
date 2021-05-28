FROM nginx:stable-alpine

COPY html /usr/share/nginx/html

COPY resources/certificates/cloudflare_ssl_certificate.crt /etc/ssl/cloudflare_ssl_certificate.crt
COPY resources/certificates/cloudflare_ssl_certificate_key.key /etc/ssl/cloudflare_ssl_certificate_key.key

COPY resources/conf/nginx.conf /etc/nginx/nginx.conf
COPY resources/conf/mime.types /etc/nginx/mime.types

EXPOSE 80
EXPOSE 443