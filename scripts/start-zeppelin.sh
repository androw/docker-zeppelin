#!/usr/bin/env sh
export MASTER_IP=`getent hosts ${SPARK_MASTER_PORT_7077_TCP_ADDR}| awk '{ print $1 }'`
cd /usr/local/zeppelin
export MASTER=spark://${MASTER_IP}:${SPARK_MASTER_ENV_SPARK_MASTER_PORT}
./bin/zeppelin.sh
