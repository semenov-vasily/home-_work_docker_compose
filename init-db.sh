#!/bin/bash
set -e

# Create the database
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE netology_import_phones;
    GRANT ALL PRIVILEGES ON DATABASE netology_import_phones TO $POSTGRES_USER;
EOSQL

# Restore the database from the dump file
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname=netology_import_phones < /docker-entrypoint-initdb.d/dump.sql