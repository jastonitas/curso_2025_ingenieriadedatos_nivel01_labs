#!/bin/bash
# Instalar Postgres local, soporte para python y sqalchemy
apt-get -qq update -y > /dev/null
apt-get -qq install -y postgresql postgresql-contrib > /dev/null
pip install -q psycopg2-binary > /dev/null
pip install -q sqlalchemy psycopg2-binary > /dev/null
echo 'Paquetes instalados.'
