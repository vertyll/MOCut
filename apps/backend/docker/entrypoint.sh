#!/bin/sh

# Wait for PostgreSQL to be ready
/usr/local/bin/wait-for-it.sh mocut-postgres:5432 --timeout=60 --strict -- echo "PostgreSQL is up - executing command"

# Run database migrations
php artisan migrate

# Start Laravel Octane server with FrankenPHP
php artisan octane:start --server=frankenphp --host=0.0.0.0 --port=8000
