FROM redis:3.0.5

MAINTAINER João Antonio Ferreira <webmaster@joao-parana.com.br>

# COPY redis.conf /usr/local/etc/redis/redis.conf
COPY run-redis-and-sinatra.sh /run-redis-and-sinatra.sh

VOLUME /opt/webapp

EXPOSE 4567

RUN apt-get update && \
    apt-get install -y ruby ruby-dev build-essential
RUN gem install --no-rdoc --no-ri sinatra json 
RUN gem install redis

EXPOSE 6379

CMD [ "/run-redis-and-sinatra.sh" ]
