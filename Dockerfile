FROM ubuntu: latest
RUN "helloworld!"
COPY index.html /var/www/html/index.html
WORKDIR /var/www/html
CMD ["-D", "FOREGROUND"]
EXPOSE 80
