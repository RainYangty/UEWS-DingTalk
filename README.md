# Unofficial DingTalk (Earthquake Early) Warning System | 非官方钉钉机器人地震预警系统
🌐 开源的中国地震信息钉钉预警系统

## 功能
- 使用钉钉机器人推送 (https://github.com/zhuifengshen/DingtalkChatbot)
- 纵波预计抵达时间提示
- 自定位置横波抵达倒数、烈度粗估
- Wolfx 防灾(防災) 实用类 免费API接口 (https://api.wolfx.jp)
- 掉线终端会吱一声，不会Say good bye
- 苹果系统理论上可以及时推送(操作方法见 [timeliness.md](timeliness.md))
- 可配置开启自启动(树莓派见[raspberryrun.md](raspberryrun.md))
- 可配置Homeassistant传感器([HA_UDTW.md](homeassistant/HA_UDTW.md))
- 可添加自定义API(仅支持含有特殊校验法用来检测内容变化的API)[cunstomize.md](cunstomize.md)

## 免责申明

UDTW和Rain Yang 不会自行对众发布地震预警/地震速报信息。其地震预警信息来源为四川地震局公开的“紧急地震信息”地震预警数据，地震速报信息来源为中国地震台网速报公开数据。若自定义API，请对API内容负责，UDTW不会承担因自定义API而导致问题产生的任何责任

## 注意

API只能1s调用1次！！！API只能1s调用1次！！！API只能1s调用1次！！！

UDTW 目前并不稳定、完善，随时可能崩溃，若遇到问题，欢迎提交Issue。若因UDTW不稳定导致并未及时发出来自四川地震局公开的「紧急地震信息」地震预警数据，在这里深感歉意

CENC、SCEEW以及自定义API可自行选择开关，在config.json中将对应选项改为true即为开

## 部署
1.安装依赖
```
pip install -r requirements.txt
```

2.完善 `config.py` 内信息

1）首先创建钉钉群聊，并添加机器人（网上有很详细流程），不过要将安全设置中勾选“加签”，如图
![勾选“加签”](pictures/1.png)

2）然后将Webhook后的token和“加签”下方的密钥分别填入文件中，并在相应位置填上手机号(可选，即可@用户)
```
"webhook": "你的token"
"secret" : "SEC...你的密钥"
```

```
at_mobiles: "手机号"
```

3）接着获取所在地的经纬度 (建议：https://lbs.qq.com/getPoint) 并填入文件对应位置中 默认为 合肥一六八中学
```
"latitude": 31.75803,
"longitude": 117.253804
```

4）最后运行
```
python main.py
```

## 协议
本仓库代码依据MIT License协议开源
