import time
import requests
from dingtalkchatbot.chatbot import DingtalkChatbot
import math
import datetime
from geopy.distance import geodesic
from threading import Thread
import json

config = json.load(open("config.json", "r"))
webhook = "https://oapi.dingtalk.com/robot/send?access_token=" + config["token"]
secret = config["secret"]  # 可选：创建机器人勾选“加签”选项时使用
robot = DingtalkChatbot(webhook, secret=secret)  # 方式二：勾选“加签”选项时使用（v1.5以上新功能）
location = [config["latitude"], config["longitude"]]    #你的坐标 [纬度, 经度] 默认为 合肥一六八中学
at_mobiles = config["at_mobiles"]   #填写你要@的钉钉手机号码
warning_localintensity_min = config["warning_localintensity_min"]

lastmd5 = 0
robot.send_text(msg = str(datetime.datetime.now()) + "地震预警已启动")

# 距离计算模块
def length(seita, fai): #seita:纬度 fai:经度        
    distance = geodesic((location[0], location[1]), (seita, fai)).km
    return distance

# #倒计时模块
def countdown(arrivetime, pos, localintensity, startarrti):
    time.sleep(1)
    arrivetime -= 1
    if localintensity < 5.0 and startarrti - arrivetime >= 4:
        if arrivetime % 10 == 0 and arrivetime <= 60 and arrivetime > 10:
            print(str(datetime.datetime.now()) + " " + str(arrivetime) + "s 后抵达")
            robot.send_text(msg = str(arrivetime) + "s (" + pos + " " + str(localintensity) + ")后抵达")
        if arrivetime <= 10 and arrivetime > 0:
            print(str(datetime.datetime.now()) + " " + str(arrivetime) + "s 后抵达")
            robot.send_text(msg = str(arrivetime) + "s (" + pos + " " + str(localintensity) + ")后抵达", at_mobiles = at_mobiles)
        elif arrivetime == 0:
            print(str(datetime.datetime.now()) + "抵达")
            robot.send_text(msg = "已 (" + pos + " " + str(localintensity) + ")抵达", at_mobiles = at_mobiles)
        elif arrivetime < 0:
            ewarn = False
            return
    elif localintensity >= 5.0 and startarrti - arrivetime >= 13:
        if arrivetime % 10 == 0 and arrivetime <= 60 and arrivetime > 10:
            print(str(datetime.datetime.now()) + " " + str(arrivetime) + "s 后抵达")
            robot.send_text(msg = str(arrivetime) + "s (" + pos + " " + str(localintensity) + ")后抵达")
        if arrivetime <= 10 and arrivetime > 0:
            print(str(datetime.datetime.now()) + " " + str(arrivetime) + "s 后抵达")
            robot.send_text(msg = str(arrivetime) + "s (" + pos + " " + str(localintensity) + ")后抵达", at_mobiles = at_mobiles)
        elif arrivetime == 0:
            print(str(datetime.datetime.now()) + "抵达")
            robot.send_text(msg = "已 (" + pos + " " + str(localintensity) + ")抵达", at_mobiles = at_mobiles)
        elif arrivetime < 0:
            ewarn = False
            return
    countdown(arrivetime = arrivetime, pos = pos, localintensity = localintensity, startarrti=startarrti)
    return

#速报模块，使用中国地震台网信息
def cenc():
    #cenc测定播报
    lastmd5 = 0
    while True:
        eqlist = ""
        try:
            eqlist = requests.get("https://api.wolfx.jp/cenc_eqlist.json") #设置等待时间，若无响应则网络出现问题： https://api.wolfx.jp/cenc_eqlist.json
        except:
            time.sleep(5)
            continue

        if eqlist.json()["md5"] != lastmd5:
            lastmd5 = eqlist.json()["md5"]
            etype = ""
            if eqlist.json()['No1']['type'] == "reviewed":
                etype = "正式测定"
            else:
                etype = "自动测定"

            tlength = length(float(eqlist.json()['No1']['latitude']), float(eqlist.json()['No1']['longitude'])) #距离

            localintensity = 0.92 + 1.63 * float(eqlist.json()['No1']['magnitude']) - 3.49 * math.log10(tlength) #本地烈度
            if localintensity <= 0:
                localintensity = 0.0
            elif localintensity < 12:
                localintensity = int(localintensity * 10) / 10.0    #保留1位小数
            elif localintensity >= 12:
                localintensity = 12.0

            print(eqlist.json()['No1']['time'] + " cenc" + etype + " " + eqlist.json()['No1']['location'] + " 发生地震 距离: " + str(int(tlength)) + " km 本地本地烈度：" + str(localintensity))
            robot.send_text(msg = eqlist.json()['No1']['time'] + " cenc" + etype + " " + eqlist.json()['No1']['location'] + " 发生地震 距离: " + str(int(tlength)) + " km 本地本地烈度：" + str(localintensity), at_mobiles = at_mobiles)
        time.sleep(1)

# 预警模块，使用wolfx公开API
def sc_eew():
    eewlastid = 0
    err = False
    while True:
        ctime = int(time.time() * 1000)
        errtime = datetime.datetime.now()   #避免因网络错误产生高延迟 导致反馈错误的时间不准
        # print("get json")
        try:
            eewwarn = requests.get("https://api.wolfx.jp/sc_eew.json")   #设置等待时间，若无响应则网络出现问题：https://api.wolfx.jp/sc_eew.json
        except:
            time.sleep(1)
            continue

        #eew预警
        if eewwarn.json()['EventID'] != eewlastid:
            eewlastid = eewwarn.json()['EventID']
            #计算与震源距离（单位km）
            print(str(datetime.datetime.now()) + eewwarn.json()['HypoCenter'] + " 发生地震(sc_eew预警) 计算距离")
            tlength = length(float(eewwarn.json()['Latitude']), float(eewwarn.json()['Longitude']))
            print(str(datetime.datetime.now()) + "距离: " + str(int(tlength)) + " km")

            #修正时间，按横波（取4km/s）抵达时间计算
            timeArray = time.strptime(eewwarn.json()['OriginTime'], "%Y-%m-%d %H:%M:%S")
            timeStamp = time.mktime(timeArray)
            arrivetime = tlength / 4 - int(time.time() - timeStamp)

            if arrivetime > 0:
                print(str(datetime.datetime.now()) + " " + str(int(arrivetime)) + "s 后抵达(S波)")
            else:
                print(str(datetime.datetime.now()) + " " + str(int(0 - arrivetime)) + "s 前已抵达(S波)")

            #计算本地烈度
            localintensity = 0.92 + 1.63 * float(eewwarn.json()['Magunitude']) - 3.49 * math.log10(tlength)
            if localintensity <= 0:
                localintensity = 0.0
            elif localintensity < 12:
                localintensity = int(localintensity * 10) / 10.0    #保留1位小数
            elif localintensity >= 12:
                localintensity = 12.0
            print(str(datetime.datetime.now()) + "本地烈度为" + str(localintensity) + "级")
            
            if arrivetime > 0:
                arrivetime = tlength / 4 - int(time.time() - timeStamp)     #修正因发送前文导致的时间延时
                if localintensity >= warning_localintensity_min:
                    print(print(str(datetime.datetime.now()) + "本地烈度超过阈值，启动倒计时"))
                    count = Thread(target=countdown, args = (int(arrivetime), eewwarn.json()['HypoCenter'], localintensity, int(arrivetime)))    #启动新线程倒计时
                    count.start()
                msg = eewwarn.json()['HypoCenter'] + "(" + str(eewwarn.json()['Latitude']) + ", " + str(eewwarn.json()['Longitude']) + ")于" + eewwarn.json()['OriginTime'] + "发生" + str(eewwarn.json()['Magunitude']) + "级地震, " + "距离震中" + str(int(tlength)) + "km" + "   估计本地烈度" + str(localintensity) + "级 " + "    预计抵达时间(S波)" + str(int(arrivetime)) + "s"
            else:
                msg = eewwarn.json()['HypoCenter'] + "(" + str(eewwarn.json()['Latitude']) + ", " + str(eewwarn.json()['Longitude']) + ")于" + eewwarn.json()['OriginTime'] + "发生" + str(eewwarn.json()['Magunitude']) + "级地震, " + "距离震中" + str(int(tlength)) + "km" + "   估计本地烈度" + str(localintensity) + "级 " + "    已抵达(S波) "
            robot.send_text(msg = msg, at_mobiles = at_mobiles)
            print(str(datetime.datetime.now()) + "发送成功")

        time.sleep(1)

def customize_API():
    API = json.load(open("customize_API.json", "r"))
    lastmd5 = 0
    while True:
        eqlist = ""
        try:
            eqlist = requests.get(API["customize_API"])
        except:
            time.sleep(5)
            continue

        if eqlist.json()[API["md5"]] != lastmd5:
            lastmd5 = eqlist.json()[API["md5"]]
            etype = ""
            if eqlist.json()[API["first"]][API["warning_type"]] == API["reviewed"]:
                etype = "正式测定"
            else:
                etype = "自动测定"

            tlength = length(float(eqlist.json()[API["first"]][API["latitude"]]), float(eqlist.json()[API["first"]][API["longitude"]])) #距离

            localintensity = 0.92 + 1.63 * float(eqlist.json()[API["first"]][API["magnitude"]]) - 3.49 * math.log10(tlength) #本地烈度
            if localintensity <= 0:
                localintensity = 0.0
            elif localintensity < 12:
                localintensity = int(localintensity * 10) / 10.0    #保留1位小数
            elif localintensity >= 12:
                localintensity = 12.0

            print(eqlist.json()['No1']['time'] + " 自定义API" + etype + " " + eqlist.json()['No1']['location'] + " 发生地震 距离: " + str(int(tlength)) + " km 本地本地烈度：" + str(localintensity))
            robot.send_text(msg = eqlist.json()['No1']['time'] + " 自定义API" + etype + " " + eqlist.json()['No1']['location'] + " 发生地震 距离: " + str(int(tlength)) + " km 本地本地烈度：" + str(localintensity), at_mobiles = at_mobiles)
        time.sleep(1)


eqli = Thread(target = cenc)
eewwa = Thread(target = sc_eew)
customize = Thread(target = customize_API)

if config["CENC_warning_system"]:
    eqli.start()
if config["SC_early_warning_system"]:
    eewwa.start()
if config["customize_API"]:
    customize.start()