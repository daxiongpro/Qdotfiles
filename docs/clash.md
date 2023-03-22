### Install:

* source proxy.zsh

```bash
# under bash shell
source ~/.Qdotfiles/clash/proxy.zsh
```

* download clash and proxy up

```bash
  # under bash shell  
  proxy download
```

port is 8999

* Open a new shell terminal, set `http_proxy` and `https_proxy` 

```bash
  # under bash shell  
  ➜  ~ proxy on  # set http_proxy and https_proxy
  ➜  ~ proxy status  # watch proxy status
  --------------
  Proxy setting
  --------------
  http_proxy=127.0.0.1:8999
  https_proxy=127.0.0.1:8999
  HTTP_PROXY=127.0.0.1:8999
  HTTPS_PROXY=127.0.0.1:8999
  --------------
  Network test
  --------------
  [0.00 s] baidu :200 OK✅
  [1.00 s] google:200 OK✅
```

* If you want to turn off `http_proxy` and `https_proxy`

```bash
  ➜  ~ proxy off
  ➜  ~ proxy status
  --------------
  Proxy setting
  --------------
  http_proxy=
  https_proxy=
  HTTP_PROXY=
  HTTPS_PROXY=
  --------------
  Network test
  --------------
  [1.00 s] baidu :200 OK✅
  [3.00 s] google:None�
```

* The website to choose node：

`http://clash.razord.top/#/proxies`

### References：

[clash download](https://github.com/Dreamacro/clash/releases)

[clash usage](https://www.cnblogs.com/rogunt/p/15127947.html)
