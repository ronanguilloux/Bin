echo "installing..."
php -d memory_limit=6G /usr/local/bin/composer install --optimize-autoloader --prefer-dist
yarn install
php bin/console cache:clear --no-warmup --env=prod
php bin/console pim:installer:assets --symlink --clean --env=prod
bin/console pim:install --force --symlink --clean --env=prod
yarn run webpack
echo "done..."
