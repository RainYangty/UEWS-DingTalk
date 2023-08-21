# Unofficial DingTalk (Earthquake Early) Warning System | 非官方钉钉机器人地震预警系统
🌐 开源的中国地震信息钉钉预警系统

## 功能
- 使用钉钉机器人推送 (https://github.com/zhuifengshen/DingtalkChatbot)
- 纵波预计抵达时间提示
- 自定位置横波抵达倒数、烈度粗估
- Wolfx 防灾(防災) 实用类 免费API接口 (https://api.wolfx.jp/cenc_eqlist.json)
- 掉线终端会吱一声，不会Say good bye
- 苹果系统理论上可以及时推送(操作方法见 [https://github.com/RainYangty/UDTW/timeliness.md](https://github.com/RainYangty/UDTW/blob/main/timeliness.md))
- 地震倒计时和播报功能(具体见 [https://github.com/RainYangty/UDTW/countdown.md](https://github.com/RainYangty/UDTW/blob/main/countdown.md))

## 注意

1.API只能1s调用1次！！！API只能1s调用1次！！！API只能1s调用1次！！！

2.若S波抵达超过120s则不再报

## 部署
1.安装依赖
```
pip install -r requirements.txt
```

2.完善 `main.py` 内信息

1）首先创建钉钉群聊，并添加机器人（网上有很详细流程），不过要将安全设置中勾选“加签”，如图
![勾选“加签”](pictures/1.png)

2）然后将Webhook和“加签”下方的密钥分别填入文件对应位置中，如图，并在相应位置填上手机号
![填入信息](pictures/2.png)

3）接着获取所在地的经纬度 (建议：https://lbs.qq.com/getPoint) 并填入文件对应位置中，如图(图中有个错误，以文件内容为准！)
![填入信息](pictures/3.png)

4）最后运行
```
python main.py
```

3.(树莓派部署)添加服务，开机自启

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

## 协议
本仓库代码依据MIT License协议开源
