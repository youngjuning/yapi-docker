#!/bin/bash
# 1、启动 MongoDB
docker run -d \
  --name mongo-yapi \
  # -p 27017:27017 \ # 为了安全，不要打开
  -v mongo_data_yapi:/data/db \
  mongo
# 2、初始化 Yapi 数据库索引及管理员账号
docker run -it --rm \
  --link mongo-yapi:mongo \
  --entrypoint npm \
  --workdir /yapi/vendors \
  youngjuning/yapi \
  run install-server
# 3、启动 Yapi 服务
docker run -d \
  --name yapi \
  --link mongo-yapi:mongo \
  --workdir /yapi/vendors \
  -p 3000:3000 \
  -v yapi_config:/yapi/ \
  youngjuning/yapi \
  server/app.js