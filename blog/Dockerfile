FROM php:8.3

WORKDIR /source
COPY . .
# exec 模式，官方推薦
# 不能連線的原因其實非常單純，host 與 container 要視為兩台不一樣的機器，因為 container 僅綁定本機－－也就是只有進 container 使用 curl http://127.0.0.1:8000 可以連線，而 host 連 container 會被視為外部連線，因此會連線失敗。
# CMD ["php", "artisan", "serve"]
# 這邊要改成
CMD ["php", "artisan", "serve", "--host", "0.0.0.0"]
# shell 模式
# CMD php artisan serve