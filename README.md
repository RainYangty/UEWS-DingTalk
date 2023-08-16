# Unofficial DingTalk (Earthquake Early) Warning System | 非官方钉钉机器人地震预警系统
🌐 开源的中国地震信息钉钉预警系统

## 功能
- 使用钉钉机器人推送 (https://github.com/zhuifengshen/DingtalkChatbot)
- 纵波预计抵达时间提示
- 自定位置横波抵达倒数、烈度粗估
- Wolfx 防灾(防災) 实用类 免费API接口 (https://api.wolfx.jp/cenc_eqlist.json)

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

2）然后将Webhook和“加签”下方的密钥分别填入文件对应位置中，如图
![填入信息](pictures/2.png)

3）接着获取所在地的经纬度 (建议：https://lbs.qq.com/getPoint/)并填入文件对应位置中，如图
![填入信息](pictures/3.png)

4）最后运行
```
python main.py
```

## 协议
本仓库代码依据MIT License协议开源
