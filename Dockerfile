FROM alpine

RUN apk add --no-cache vim

# Build 一個新的 image，完成後 tag 為 vim 
# docker build -t vim .

# 使用新的 image 執行 container
# docker run --rm -it --name new vim