FROM alpine

MAINTAINER Nicolas Lorin <androw95220@gmail.com>

RUN apk add --update openjdk8-jre curl bash && rm -rf /var/cache/apk/*

RUN curl -s https://www-us.apache.org/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz | tar -xz -C /usr/local/ && curl -s http://www-us.apache.org/dist/zeppelin/zeppelin-0.8.2/zeppelin-0.8.2-bin-all.tgz | tar -xz -C /usr/local/ 

RUN cd /usr/local && ln -s spark-2.4.4-bin-hadoop2.7 spark && ln -s zeppelin-0.8.2-bin-all zeppelin

ADD scripts/*.sh /
ADD scripts/spark-defaults.conf /spark-defaults.conf

ENV SPARK_HOME /usr/local/spark

EXPOSE 8080 8081 
CMD ["/start-zeppelin.sh"]
