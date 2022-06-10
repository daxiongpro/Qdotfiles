### 选择节点的网站：

http://clash.razord.top/#/proxies

### Install:

* make sure clash config exist.
  `qdot b`
* download config file

  ```bash
  cd ~/clash
  wget xxx.yaml # your clash config file. go to clash website to buy it.
  ```
* use tmux:

  ```
  tmux new -s proxy
  proxy up
  ```
* port is 8999


### Proxy utilities in Qdotfiles
* `proxy [on|off|up|status]`

  ```
  ➜  ~ proxy on
  ➜  ~ proxy status
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
  ➜  ~
  ➜  ~
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
  ➜  ~
  ```

### References：

[clash download](https://github.com/Dreamacro/clash/releases)

[clash usage](https://www.cnblogs.com/rogunt/p/15127947.html)
