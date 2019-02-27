#!/bin/bash
echo -e "\033[32m download new package (version $1) \033[0m"
curl -L http://registry.npm.taobao.org/yapi-vendor/download/yapi-vendor-$1.tgz -o yapi.tgz
echo -e "\033[32m build new image \033[0m"
docker build -t yapi-docker .