FROM nginx
LABEL maintainer="Manuel Bernal Llinares <mbdebian@gmail.com>"

# Overwrite default site
COPY sites/default.conf /etc/nginx/conf.d/default.conf
