FROM alpine:3.9

RUN apk add --no-cache postgresql-client

COPY ./pg_isready.sh ./scripts/
