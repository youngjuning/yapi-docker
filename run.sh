#!/bin/bash
# 1、启动 MongoDB
docker run -d \
  --restart always \
  --name mongo-yapi \
  -v mongo_data_yapi:/data/db \
  mongo
# 2、初始化 Yapi 数据库索引及管理员账号
docker run -it --rm \
  --link mongo-yapi:mongo \
  --entrypoint npm \
  --workdir /yapi/vendors \
  -v yapi_data:/yapi/config/ \
  youngjuning/yapi \
  run install-server
# 3、启动 Yapi 服务
docker run -d \
  --restart always \
  --name yapi \
  --link mongo-yapi:mongo \
  --workdir /yapi/vendors \
  -p 3000:3000 \
  -v yapi_data:/yapi/config/ \
  youngjuning/yapi \
  server/app.js
