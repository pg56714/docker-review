# FROM php:8.3
# 用alpine版本，減少容器大小，減少蠻多的，差了400多MB
FROM php:8.3-alpine

# 全域設定
WORKDIR /source

# 安裝環境
RUN apk add --no-cache unzip

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

RUN set -xe && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# 安裝程式依賴套件
COPY composer.* ./
RUN composer install --no-dev --no-scripts && composer clear-cache

# 複製程式碼
COPY . .
RUN composer run post-autoload-dump

CMD ["php", "artisan", "serve", "--host", "0.0.0.0"]



# # 全域設定
# WORKDIR /source

# # 安裝環境、安裝工具
# RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
# RUN apt update && apt install unzip

# # 安裝程式依賴套件
# COPY composer.* ./
# RUN composer install --no-scripts

# # 複製程式碼
# COPY . .
# RUN composer run post-autoload-dump

# CMD ["php", "artisan", "serve", "--host", "0.0.0.0"]


# exec 模式，官方推薦
# 不能連線的原因其實非常單純，host 與 container 要視為兩台不一樣的機器，因為 container 僅綁定本機－－也就是只有進 container 使用 curl http://127.0.0.1:8000 可以連線，而 host 連 container 會被視為外部連線，因此會連線失敗。
# CMD ["php", "artisan", "serve"]
# 這邊要改成
# CMD ["php", "artisan", "serve", "--host", "0.0.0.0"]
# shell 模式
# CMD php artisan serve