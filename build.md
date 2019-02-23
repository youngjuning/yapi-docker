## 构建任意版本 yapi 镜像

### 编写 Dockerfile

```
FROM 10.15.1 as builder
RUN apt-get install git python make openssl tar gcc
ADD yapi.tgz /home/
RUN mkdir /api && mv /home/package /api/vendors
RUN cd /api/vendors && \
npm install --production --registry https://registry.npm.taobao.org
FROM 10.15.1
MAINTAINER youngjuning@aliyun.com
ENV TZ="Asia/Shanghai" HOME="/"
WORKDIR ${HOME}
COPY --from=builder /api/vendors /api/vendors
COPY config.json /api/
EXPOSE 3000
ENTRYPOINT ["node"]
```

```
FROM 10.15.1 as builder
RUN apt-get install git python make openssl tar gcc
ADD yapi.tgz /home/
RUN mkdir /api && mv /home/package /api/vendors
RUN cd /api/vendors && \
npm install --production --registry https://registry.npm.taobao.org
FROM 10.15.1
MAINTAINER youngjuning@aliyun.com
ENV TZ="Asia/Shanghai" HOME="/"
WORKDIR ${HOME}
COPY --from=builder /api/vendors /api/vendors
COPY config.json /api/
EXPOSE 3000
ENTRYPOINT ["node"]
```

### 自定义配置文件 config.json

```json
{
  "port": "3000",
  "adminAccount": "youngjuning@aliyun.com",
  "db": {
    "servername": "mongo",
    "DATABASE": "yapi",
    "port": 27017
  }
}
```

### 镜像构建脚本 build

```sh
$ wget -O yapi.tgz http://registry.npm.taobao.org/yapi-vendor/download/yapi-vendor-1.5.6.tgz
$ docker build -t youngjuning/yapi:1.5.6 .
```

> 使脚本可执行： chmod a+x build

### 发布到 DockerHub

```sh
$ docker login
$ docker tag youngjuning/yapi:1.5.6 youngjuning/yapi:1.5.6
$ docker push youngjuning/yapi:1.5.6
```