FROM nginx

RUN apt-get update -y && apt-get install unzip

RUN mkdir -p /www/static

COPY ./src/static/ /www/static

RUN cd /www/static & unzip *.zip && rm *.zip

COPY ./nginx/default.conf /etc/nginx/conf.d/