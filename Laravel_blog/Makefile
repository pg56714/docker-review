#!/usr/bin/make -f
IMAGE := laravel
VERSION := latest

.PHONY: all build rebuild shell run

# ------------------------------------------------------------------------------

all: build

# 建置 image
build:
	docker build -t=$(IMAGE):$(VERSION) .

# 不使用 cache 建置 image
# rebuild:
# 	docker build -t=$(IMAGE):$(VERSION) --no-cache .
# 這樣會讓檔案名稱重複，進而使舊檔變成none

clean:
	docker rmi -f $(IMAGE):$(VERSION)

rebuild:
	docker build -t=$(IMAGE):$(VERSION) --no-cache .

# 執行並使用 shell 進入 container
shell:
	docker run --rm -it -p 8000:8000 $(IMAGE):$(VERSION) bash

# 執行 container
run:
	docker run --rm -it -p 8000:8000 $(IMAGE):$(VERSION)


#------------------------------------------------------------------------------
# use method
# .PHONY: all build test clean

# all: build test clean

# build:
#     # build process

# test:
#     # test process

# clean:
#     # clean process
