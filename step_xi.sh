#!/bin/bash
sudo -u postgres psql -c "CREATE database prxdb"
sudo -u postgres psql -c "CREATE USER prxadmin WITH password 'prxadmin'"
sudo -u postgres psql -c "GRANT ALL privileges ON DATABASE prxdb TO prxadmin"
sudo -u postgres psql -d prxdb -f ../db/ddl/prxdb.sql
