#!/bin/sh

RETRIES=${RETRIES:-15}
DELAY=${DELAY:-1}

until pg_isready -h ${HOST:-localhost} -p ${PORT:-5432} -d ${DBNAME:-postgres} || [ $RETRIES -eq 1 ]; do
  RETRIES=$((RETRIES-=1))
  echo "Waiting for postgres server, $((RETRIES)) remaining attempts..."
  sleep $DELAY
done

if [ $RETRIES -eq 0 ]
then
    exit 2
fi
exit 0
