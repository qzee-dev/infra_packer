#!/bin/bash
SECRET_JSON=$(aws secretsmanager get-secret-value --secret-id my-rds-credentials --query SecretString --output text)
export DB_USER=$(echo $SECRET_JSON | jq -r .username)
export DB_PASSWORD=$(echo $SECRET_JSON | jq -r .password)
export DB_HOST=$(echo $SECRET_JSON | jq -r .host)
export DB_NAME=$(echo $SECRET_JSON | jq -r .dbname)

# Write to environment file for docker-compose
cat <<EOF > /opt/app/.env
DB_USER=$DB_USER
DB_PASSWORD=$DB_PASSWORD
DB_HOST=$DB_HOST
DB_NAME=$DB_NAME
EOF
