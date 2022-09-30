FROM debian:11

WORKDIR /goclimb

RUN apt update
RUN apt install nginx -y

# RUN rm /etc/nginx/conf.d/nginx.conf

COPY index.html goclimb/index.html

RUN service nginx start

COPY nginx.conf /etc/nginx/conf.d/

RUN service nginx reload


# RUN adduser deploy
