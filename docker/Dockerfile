# Dockerfile for the laravel.io application
FROM ubuntu:22.04   
COPY . /app
WORKDIR /app 
RUN chmod +x /app/seed.sh   

# Define default values for the Enviroment Variables
ENV TZ=Europe \
    DEBIAN_FRONTEND=noninteractive

ENV DB_HOST laraveldb
ENV DB_DATABASE laravel
ENV DB_USERNAME laraveluser
ENV DB_PASSWORD secret

RUN apt-get update && \
    apt-get install -y software-properties-common


# Install app packages
RUN add-apt-repository ppa:ondrej/php && apt-get update
RUN apt install -y php8.2
RUN apt install -y php8.2-fpm
RUN apt install -y php8.2-zip
RUN apt install -y php8.2-mbstring
RUN apt install -y php8.2-tokenizer
RUN apt install -y php8.2-mysqli
RUN apt install -y php8.2-gd
RUN apt install -y php8.2-xml
RUN apt install -y php8.2-bcmath
RUN apt install -y php8.2-intl
RUN apt install -y php8.2-curl
RUN apt install -y mysql-client
RUN apt install -y nodejs
RUN apt install -y composer
RUN apt install -y npm

# Clone Laravel.io repository
RUN git clone https://github.com/laravelio/laravel.io.git /laravel
WORKDIR /laravel
RUN cp .env.example .env
# Update composer
RUN composer update

# Install composer
RUN composer install

# Setup a local database called laravel

# Setup compose
#RUN composer setup

# Install npm
RUN npm install


# Generate key 
RUN php artisan key:generate
RUN npm run build
# Expose port 8000
EXPOSE 8000
# Start Laravel.io server

#CMD php artisan migrate; php artisan serve --host 0.0.0.0
#CMD ["sh", "-c", "php artisan migrate:refresh --seed && php artisan serve --host=0.0.0.0 --port=8000"]
ENTRYPOINT ["/app/seed.sh"]