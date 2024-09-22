# PHP 環境基礎
FROM php:8.3-alpine AS base

# 安裝 extension
RUN set -xe && \
    apk add --no-cache --virtual .build-deps \
    autoconf \
    g++ \
    make \
    && \
    docker-php-ext-install \
    bcmath \
    && \
    pecl install \
    redis \
    && \
    docker-php-ext-enable \
    redis \
    && \
    apk del .build-deps \
    && \
    php -m




# npm 建置 stage
FROM node:22-alpine AS npm_builder

WORKDIR /source

COPY package.* ./
# 依照 npm run production 提示把 vue-template-compiler 先安裝進去
RUN npm install && npm install vue-template-compiler --save-dev --production=false

COPY . .

RUN npm run production




# Composer 安裝依賴
FROM base AS composer_builder 

WORKDIR /source

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# 安裝所有程式依賴的套件，含測試套件
COPY composer.* ./
RUN composer install --no-scripts && composer clear-cache

# 複製程式碼
COPY . .

RUN composer run post-autoload-dump

# 執行測試
RUN php vendor/bin/phpunit

# 移除測試套件
RUN composer install --no-dev




# 上線環境
FROM base

WORKDIR /var/www/html

COPY --from=composer_builder /source/vendor ./vendor
COPY --from=npm_builder /source/public/js ./public/js
COPY --from=npm_builder /source/public/css ./public/css
COPY --from=npm_builder /source/public/mix-manifest.json ./public

COPY . .

COPY --from=composer_builder /source/bootstrap ./bootstrap

CMD ["php", "artisan", "serve", "--host", "0.0.0.0"]
