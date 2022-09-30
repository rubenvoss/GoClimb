FROM debian:11

WORKDIR /goclimb

RUN apt update
RUN apt install nginx -y

# RUN rm /etc/nginx/conf.d/nginx.conf

COPY index.html .


COPY nginx.conf /etc/nginx/conf.d/

# RUN service nginx reload
RUN service nginx start


# RUN adduser deploy
