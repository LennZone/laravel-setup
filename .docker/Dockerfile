FROM php:8.2-apache AS Base

RUN echo " \
    export LS_OPTIONS='--color=auto' \n \
    alias ls='ls \$LS_OPTIONS' \n \
    alias ll='ls \$LS_OPTIONS -la' \n \
    alias l='ls \$LS_OPTIONS -lA' \n \
    alias rm='rm -i' \n \
    alias cp='cp -i' \n \
    alias mv='mv -i' \n " >> /etc/bash.bashrc

RUN apt-get update &&\
    apt-get upgrade -y &&\
    apt-get install -y  \
    nano \
    git  \
    unzip \
    npm &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN npm install

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

CMD ["apache2ctl","-D","FOREGROUND"]
