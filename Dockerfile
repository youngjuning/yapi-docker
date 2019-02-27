FROM node:10.15.1-alpine as builder

# 安装依赖
# RUN apk add --no-cache git python make openssl tar gcc
ADD yapi.tgz /home/

RUN mkdir /yapi && mv /home/package /yapi/vendors

RUN cd /yapi/vendors && \
  npm install --production --registry https://registry.npm.taobao.org
  
FROM node:10.15.1-alpine

MAINTAINER youngjuning@aliyun.com
ENV TZ="Asia/Shanghai" HOME="/"
WORKDIR ${HOME}
COPY --from=builder /yapi/vendors /yapi/vendors
COPY config.json /yapi/
EXPOSE 3000
ENTRYPOINT ["node"]

# RUN mkdir /yapi/config
# COPY /yapi/config.json /yapi/config/

# RUN cd /yapi/vendors/server