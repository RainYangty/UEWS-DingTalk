# Unofficial DingTalk (Earthquake Early) Warning System | 非官方钉钉机器人地震预警系统
🌐 开源的中国地震信息钉钉预警系统

## 功能
- 使用钉钉机器人推送 (https://github.com/zhuifengshen/DingtalkChatbot)
- 纵波预计抵达时间提示
- 自定位置横波抵达倒数、烈度粗估
- Wolfx 防灾(防災) 实用类 免费API接口 (https://api.wolfx.jp)
- 掉线终端会吱一声，不会Say good bye
- 苹果系统理论上可以及时推送(操作方法见 [timeliness.md](timeliness.md))
- 地震倒计时和播报功能(具体见 [countdown.md](countdown.md))
- 可配置开启自启动(树莓派见[raspberryrun.md](raspberryrun.md))

## 注意

API只能1s调用1次！！！API只能1s调用1次！！！API只能1s调用1次！！！

## 部署
1.安装依赖
```
pip install -r requirements.txt
```

2.完善 `main.py` 内信息

1）首先创建钉钉群聊，并添加机器人（网上有很详细流程），不过要将安全设置中勾选“加签”，如图
![勾选“加签”](pictures/1.png)

2）然后将Webhook和“加签”下方的密钥分别填入文件对应位置中，如图，并在相应位置填上手机号
```
webhook = 'https://oapi.dingtalk.com/robot/send?access_token=你的token'
secret = 'SEC...你的密钥'  # 可选：创建机器人勾选“加签”选项时使用
```

3）接着获取所在地的经纬度 (建议：https://lbs.qq.com/getPoint) 并填入文件对应位置中，如图(图中有个错误，以文件内容为准！)
```
location = [31.75803, 117.253804]    #你的坐标 [纬度, 经度] 默认为 合肥一六八中学
```

4）最后运行
```
python main.py
```

## 协议
本仓库代码依据MIT License协议开源
