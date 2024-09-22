# # 使用 cargo 建立專案
# cargo new rocket --bin

# cargo run
# docker run --rm -it -v $PWD:/source -w /source rust:1.46 bash

FROM rust:1.46

WORKDIR /usr/src/app

ENV USER=dummy

# Rocket 官方教學有提到要開 nightly
# 會在這裡執行 cargo init，這是 cargo build 一個 issue
RUN rustup default nightly && cargo init --bin --name dummy .

COPY Cargo.* ./

# 下載並編譯依賴
RUN cargo build

COPY . .

# 編譯主程式
RUN cargo build

CMD ["cargo", "run"]