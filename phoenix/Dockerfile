# mix archive.install hex phx_new 1.5.5
# mix phx.new --no-ecto --no-webpack --app ironman phoenix

# # 啟動 server
# mix phx.server

# docker run --rm -it -v $PWD:/source -w /source elixir:1.10-alpine sh

FROM elixir:1.10-alpine

WORKDIR /usr/app/src

# 準備套件工具的設定
RUN set -xe && \
    mix local.hex --force && \
    mix local.rebar --force

# 安裝套件
COPY mix.* ./
RUN mix deps.get

# 原始碼與編譯
COPY . .
RUN mix compile

# 啟動 server 的指令
CMD ["mix", "phx.server"]

# docker build -t=phoenix .
# docker run --rm -it -p 4000:4000 phoenix