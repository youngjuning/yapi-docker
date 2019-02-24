# 1、停止并删除旧版容器
docker rm -f yapi
# 2、获取最新镜像
docker pull youngjuning/yapi
# 3、启动新容器
docker run -d \
  --name yapi \
  --link mongo-yapi:mongo \
  --workdir /yapi/vendors \
  -p 3000:3000 \
  youngjuning/yapi \
  server/app.js