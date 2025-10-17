BUILD_TIME 			  := $(shell LC_TIME=zh_CN.UTF-8 date +"%Y-%m-%d %H:%M:%S %A")
BUILD_TIME            := $(shell date +%Y-%m-%dT%H:%M:%S%z 2>/dev/null || powershell -Command "Get-Date -Format o")
DOCKER_REPO       ?= zeusro
DOCKER_TAG         ?= kube-killer:latest
IMAGE_FULL           ?= $(DOCKER_REPO)/$(DOCKER_TAG)
DOCKER_REGISTRY ?= registry.cn-shenzhen.aliyuncs.com/
ARCH                     ?= amd64

auto_commit: 
	git add .
	git commit -am "$(BUILD_TIME)"
	git pull
	git push
