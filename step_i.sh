#!/bin/bash
sudo apt update
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main" > /etc/apt/sources.list.d/PostgreSQL.list'
sudo apt update
sudo apt install -y build-essential autoconf libtool nasm cmake pkg-config git python libssl-dev libblas-dev liblapack-dev libpng-dev openjdk-8-jdk bash-completion g++ zlib1g-dev postgresql-11 postgresql-server-dev-all libpq-dev unzip openjdk-8-jdk
