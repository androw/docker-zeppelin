FROM ubuntu

MAINTAINER Nicolas Lorin <androw95220@gmail.com>

RUN apt-get update && apt-get -y install default-jre curl && apt-get -y autoclean && apt-get -y clean && apt-get -y autoremove

RUN curl -s http://www-us.apache.org/dist/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz | tar -xz -C /usr/local/ && curl -s http://www-us.apache.org/dist/incubator/zeppelin/0.5.6-incubating/zeppelin-0.5.6-incubating-bin-all.tgz | tar -xz -C /usr/local/ 

RUN cd /usr/local && ln -s spark-1.6.1-bin-hadoop2.6 spark && ln -s zeppelin-0.5.6-incubating-bin-all zeppelin

ADD scripts/*.sh /
ADD scripts/spark-defaults.conf /spark-defaults.conf

ENV SPARK_HOME /usr/local/spark

EXPOSE 8080 8081 
CMD ["bash"]
