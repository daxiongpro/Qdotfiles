### docker镜像

搜索dockerhub上的镜像

```
docker search
```

获取dockerhub上的镜像

```bash
# docker pull img_name:version
# eg.
docker pull nginx:latest
```

删除镜像

```bash
dockers rmi -f {{docker_id}}
# 删除镜像之前先要删除对应的容器
```



### docker容器

从镜像生成容器

```bash
docker run -d -p100:80 nginx
# 100是外部端口，80是内部端口；
# -d:后台运行
```

