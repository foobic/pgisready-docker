# pgisready-docker
Dockerfile for `pg_isready` utility.

Convenient for make sure that database is running and accepting connections, especially on CI.

## Usage:

### Docker
```
docker run -e HOST=testdb -e DELAY=2 -e RETRIES=2 \
           --network example_network \
           foobic/pg_isready \
            /scripts/pg_isready.sh 
```

### Docker-compose

```
version: '3.5'

services:
  testdb:
    image: postgres:11
    environment:
      POSTGRES_DB: testdb
      POSTGRES_USER: testuser
      POSTGRES_PASSWORD: testpassword
      PGDATA: /data/postgres
    ports:
      - "5432:5432"

  check_testdb:
    image: foobic/pgisready-docker:latest
    environment:
      HOST: testdb
      RETRIES: 5
    command: /scripts/pg_isready.sh
```
