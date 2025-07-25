#! /bin/bash
if [ "$SEED_DATABASE" = "true" ]; then
    php artisan key:generate
    php artisan migrate --seed
else
    php artisan key:generate
    php artisan migrate
fi
# Start the application
php artisan serve --host=0.0.0.0