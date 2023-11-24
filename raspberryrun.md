# (树莓派部署)添加服务，开机自启
## 操作方法从网络获取，并在本地跑通，效果因系统而异

1)给予操作权限
```
chmod 777  main.py
```
2)添加服务,保存脚本为/etc/init.d/UDTW文件(请修改```nohup python3 ```后的地址，使之指向main.py)
```
#!/bin/bash
### BEGIN INIT INFO
# Provides:          XXX
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start XXX daemon at boot time
# Description:       Start XXX daemon at boot time
### END INIT INFO
case "$1" in
    start):
        echo "Starting app"
        nohup python3 main.py & 
    ;;
    stop):
        echo "to"
        #kill $( ps aux | grep -m 1 'python3 main.py' | awk '{ print $2 }') ;; *)
        echo "Usage: service start_tool start|stop"
        exit 1 ;;
esac

exit 0

```
4)设置为开机启动项(若提示失败请刷新配置 ```systemctl daemon-reload``` )
```
sudo update-rc.d UDTW defaults
```