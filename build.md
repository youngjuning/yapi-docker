## 构建任意版本 yapi 镜像

### 镜像构建脚本 build

> 使脚本可执行： chmod a+x build

```sh
$ ./build.sh 1.5.6
```

### 发布到 DockerHub

#### 登录

```sh
$ docker login
```

#### 发布

```sh
$ docker tag youngjuning/yapi:latest youngjuning/yapi:1.5.6
$ docker push youngjuning/yapi:1.5.6
```