# from https://www.drupal.org/requirements/php#drupalversions
FROM goruha/drupal-base

RUN echo 'http://alpine.gliderlabs.com/alpine/edge/main' > /etc/apk/repositories && \
    echo 'http://alpine.gliderlabs.com/alpine/edge/community' >> /etc/apk/repositories && \
    echo 'http://alpine.gliderlabs.com/alpine/edge/testing' >> /etc/apk/repositories && \
    apk update && apk add --update \
      git \
     php5-xdebug \
	  && rm -rf /var/cache/apk/*

      # Install composer
RUN  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

     # Add composer parallel install plugin
RUN  composer global require "hirak/prestissimo:^0.3"