# yapi-docker

## 使用 youngjuning/yapi

> 使脚本可执行： chmod a+x run.sh

```sh
$ ./run.sh
```

- 默认登录账号 `admin@admin.com`，密码 `ymfe.org`
- 自定义配置文件挂载到目录 `/api/config.json`，官方自定义配置文件 -> [传送门](https://github.com/YMFE/yapi/blob/master/config_example.json)

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

### 发布

```sh
$ docker tag youngjuning/yapi:latest youngjuning/yapi:1.5.6
$ docker push youngjuning/yapi:1.5.6
```

## TODO

1. docker-compose 文件