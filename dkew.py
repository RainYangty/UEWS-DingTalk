from dingtalkchatbot.chatbot import DingtalkChatbot
import requests

webhook = 'https://oapi.dingtalk.com/robot/send?access_token=你的token'
secret = 'SEC...你的密钥'  # 可选：创建机器人勾选“加签”选项时使用
robot = DingtalkChatbot(webhook, secret=secret)  # 方式二：勾选“加签”选项时使用（v1.5以上新功能）
location = [31.75803, 117.253804]    #你的坐标 [纬度, 经度] 默认为 合肥一六八中学
at_mobiles = ['']    #填写你注册钉钉的手机号码

