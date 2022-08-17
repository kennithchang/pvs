# Docker安装
---
### 1. Nginx配置
```
location / {
        proxy_pass   http://127.0.0.1:8889/;
}
```
### 2. 创建镜像

```
$ docker build -t pvs .
```

### 3. 创建容器

```bash
$ docker run -d -p 8889:8889 -v /opt/data:/data pvs:latest
```

把物理机的 `/opt/data` 挂载到容器的 `/data` 目录下, 访问: `http://127.0.0.1:8889/` 正常访问则代表安装成功

### 4 安裝mongodb3.4.0

### 5 添加mongodb用户

```bash
# mongo
> use xunfeng
> db.createUser({user:'scan',pwd:'your password',roles:[{role:'dbOwner',db:'xunfeng'}]})
> exit
```

这里的 `scan`和`your password` 需要更换为你的mongodb的账户和密码。

### 6. 导入数据库

进入 `db` 文件夹, 执行如下命令:

```
# mongorestore -h 127.0.0.1 --port 27017 -d xunfeng .
```


### 7. 修改配置

修改系统数据库配置脚本 `config.ini`:

```python
MONGODB = 10.1.2.233
MONGODB_PORT = 27017
DB_USERNAME = scan
DB_PASSWORD = scanlol66
DB_NAME = xunfeng
PORT = 8889   #项目端口
```

### 4. Docker 镜像信息

|类型 | 用户名 | 密码 |
|----- |----- |-----|
| mongodb 数据库 | scan | scanlol66 |
| mongodb 端口 | 27017| - |
| 漏洞扫描物理路径 | /opt/xunfeng | - |
| MASSCAN 路径| /opt/xunfeng/masscan/linux_64/masscan | - |