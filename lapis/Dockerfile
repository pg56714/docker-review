# lapis new

# # 使用 MoonScript 需要編譯
# moonc *.moon

# lapis server

# docker run --rm -it -v $PWD:/source -w /source mileschou/lapis:alpine sh

FROM mileschou/lapis:alpine

WORKDIR /usr/src/app

COPY . .

RUN moonc *.moon

CMD ["lapis", "server"]