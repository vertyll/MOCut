#!/bin/sh

# Wait for PostgreSQL to be ready
/usr/local/bin/wait-for-it.sh mocut-postgres:5432 --timeout=30 --strict -- echo "PostgreSQL is up - executing command"

# Run database migrations
php artisan migrate

# Start FrankenPHP server
exec frankenphp php-server -r public/
