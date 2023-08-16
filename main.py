import time
import requests
from dingtalkchatbot.chatbot import DingtalkChatbot
import math
import datetime
from geopy.distance import geodesic

webhook = 'https://oapi.dingtalk.com/robot/send?access_token=你的token'
secret = 'SEC...你的密钥'  # 可选：创建机器人勾选“加签”选项时使用
robot = DingtalkChatbot(webhook, secret=secret)
location = [29.825287, 106.437485]  #你的坐标 [经度, 纬度] 默认为 重庆北碚

lastmd5 = 0
robot.send_text(msg="地震预警已启动")

def length(seita, fai): #seita:纬度 fai:经度        
    """ R = 6371.0      计算方法参考：https://www.zhihu.com/question/265407371，误差较大
    seita = seita / 180 * math.pi
    fai = fai / 180 * math.pi
    return R * math.acos(math.sin(seita) * math.sin(31.75803 / 180.0 * math.pi) + math.cos(seita) * math.cos(31.75803 / 180.0 * math.pi) * math.cos(117.253804 / 180.0 * math.pi - fai))"""
    distance = geodesic((location[0], location[1]), (seita, fai)).km    #直接调用 geopy 库计算
    return distance

while True:
    ctime = int(time.time() * 1000)
    # print("get json")
    response = requests.get("https://api.wolfx.jp/cenc_eqlist.json")

    # print(response.json()['md5'])

    if response.json()['md5'] != lastmd5:
        print(str(datetime.datetime.now()) + "检测到地震")
        lastmd5 = response.json()['md5']
        if response.json()['No0']['type'] == "reviewed":
            etype = "正式测定"
        else:
            etype = "自动测定"
        msg = response.json()['No0']['location'] + "(" + response.json()['No0']['latitude'] + ", " + response.json()['No0']['longitude'] + ")于" + response.json()['No0']['time'] + "发生" + response.json()['No0']['magnitude'] + "级地震(" + etype + ")"
        robot.send_text(msg = msg)

        #计算与震源距离（单位km）
        tlength = length(float(response.json()['No0']['latitude']), float(response.json()['No0']['longitude']))

        #计算本地震度 （公式参考：https://github.com/Project-BS-CN/CEIV-1.0.0/blob/main/js/index.js）
        localmagnitude = 0.92 + 1.63 * float(response.json()['No0']['magnitude']) - 3.49 * math.log10(tlength)
        if localmagnitude <= 0:
            localmagnitude = 0.0
        elif localmagnitude < 12:
            localmagnitude = int(localmagnitude * 10) / 10.0    #保留1位小数
        robot.send_text(msg = "距离震中" + str(int(tlength)) + "km" + ", 估计本地" + str(localmagnitude) + "级")

        #修正时间，按横波（取4km/s）抵达时间计算
        timeArray = time.strptime(response.json()['No0']['time'], "%Y-%m-%d %H:%M:%S")
        timeStamp = time.mktime(timeArray)
        arrivetime = tlength / 4 - int(time.time() - timeStamp)


        if arrivetime > 0:
            robot.send_text(msg = "预计抵达时间(S波)" + str(int(arrivetime)) + "s")
        else:
            robot.send_text(msg = "已抵达(S波)")

    
    time.sleep(1)