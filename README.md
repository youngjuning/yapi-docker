# yapi-docker

## 使用 youngjuning/yapi

> 使脚本可执行： chmod a+x run.sh

```sh
$ ./run.sh
```

- 默认登录账号 `admin@admin.com`，密码 `ymfe.org`
- 自定义配置文件挂载到目录 `/api/config.json`，官方自定义配置文件 -> [传送门](https://github.com/YMFE/yapi/blob/master/config_example.json)

## 修改管理员账号密码

### 暴露 27017 端口

```sh
$ docker rm -f mongo-yapi
$ docker run -d \
  --name mongo-yapi \
  -v mongo_data_yapi:/data/db \
  -p 27017:27017 \
  mongo
```

### 使用 Navicat 连接数据库

> 连接不需要密码，连接之后修改 user 表中的 username 字段。
> 不要修改密码，yapi做了密码加密；这个请登录平台修改

### 关闭暴露的端口

```sh
$ docker rm -f mongo-yapi
$ docker run -d \
  --name mongo-yapi \
  -v mongo_data_yapi:/data/db \
  mongo
```

## 邮箱配置

### QQ邮箱

```json
{
  "port": "3000",
  "adminAccount": "youngjuning@aliyun.com",
  "db": {
    "servername": "mongo",
    "DATABASE": "yapi",
    "port": 27017
  },
  "mail": {
    "enable": true,
    "host": "smtp.qq.com",
    "port": 465,
    "from": "******@qq.com",
    "auth": {
      "user": "******@qq.com",
      "pass": "授权码"
    }
  },
  "versionNotify": true
}
```

### 163邮箱

```json
{
  "port": "3000",
  "adminAccount": "1003719811@qq.com",
  "db": {
    "servername": "mongo",
    "DATABASE": "yapi",
    "port": 27017
  },
  "mail": {
    "enable": true,
    "host": "smtp.163.com",
    "port": 465,
    "from": "******@163.com",
    "auth": {
      "user": "******@163.com",
      "pass": "授权码"
    }
  },
  "versionNotify": true
}
```

## 构建任意版本 yapi 镜像

### 镜像构建脚本 build

> 使脚本可执行： chmod a+x build.sh

```sh
# ./build.sh 1.5.6
$ ./build.sh <Version>
```

## 发布到 DockerHub

### 登录

```sh
$ docker login
```

### 发布

```sh
# 1.5.6 为yapi版本号
$ docker tag yapi-docker youngjuning/yapi
$ docker tag yapi-docker youngjuning/yapi:1.5.6
$ docker push yapi-docker youngjuning/yapi
$ docker push yapi-docker youngjuning/yapi:1.5.6
```

## 常用命令

### 关闭Yapi

```sh
$ docker stop yapi
```

### 启动 Yapi

```sh
$ docker start yapi
```

### 升级 Yapi

> 使脚本可执行： chmod a+x upgrade.sh

```sh
$ ./upgrade.sh
```

## TODO

1. docker-compose 文件
