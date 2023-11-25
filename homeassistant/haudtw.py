import time
import requests
import math
import datetime
from geopy.distance import geodesic
from threading import Thread
import json

location = [31.75803, 117.253804]    #你的坐标 [纬度, 经度] 默认为 合肥一六八中学

# 距离计算模块
def length(seita, fai): #seita:纬度 fai:经度        
    distance = geodesic((location[0], location[1]), (seita, fai)).km
    return distance

def cenc():
    #cenc测定播报
    lastmd5 = 0
    err = False
    ctime = int(time.time() * 1000)
    errtime = datetime.datetime.now()   #避免因网络错误产生高延迟 导致反馈错误的时间不准
    eqlist = ""
    try:
        eqlist = requests.get("https://api.wolfx.jp/cenc_eqlist.json", timeout = 200) #设置等待时间，若无响应则网络出现问题： https://api.wolfx.jp/cenc_eqlist.json
    except:
        cencinfo = ["error", "error", "error", "error", "error"]
        return cencinfo

    if eqlist.json()['md5'] != lastmd5:
        lastmd5 = eqlist.json()['md5']
        etype = ""
        if eqlist.json()['No0']['type'] == "reviewed":
            etype = "正式测定"
        else:
            etype = "自动测定"

        tlength = length(float(eqlist.json()['No0']['latitude']), float(eqlist.json()['No0']['longitude'])) #距离

        localmagnitude = 0.92 + 1.63 * float(eqlist.json()['No0']['magnitude']) - 3.49 * math.log10(tlength) #本地烈度
        if localmagnitude <= 0:
            localmagnitude = 0.0
        elif localmagnitude < 12:
            localmagnitude = int(localmagnitude * 10) / 10.0    #保留1位小数
        elif localmagnitude >= 12:
            localmagnitude = 12.0


        cencinfo = [eqlist.json()['No0']['location'], eqlist.json()['No0']['magnitude'], str(int(tlength)), str(localmagnitude), etype]
        return cencinfo
    
# 预警模块，使用wolfx公开API
def sc_eew():
    eewlastid = 0
    ewarn = False
    err = False
    ctime = int(time.time() * 1000)
    errtime = datetime.datetime.now()   #避免因网络错误产生高延迟 导致反馈错误的时间不准
    eewwarn = ""
    # print("get json")
    try:
        eewwarn = requests.get("https://api.wolfx.jp/sc_eew.json")   #设置等待时间，若无响应则网络出现问题：https://api.wolfx.jp/sc_eew.json
    except:
        eewinfo = ["error", "error", "error", "error", "error"]
        return 

    #eew预警
    if eewwarn.json()['EventID'] != eewlastid:
        ewarn = True
        eewlastid = eewwarn.json()['EventID']
        #计算与震源距离（单位km）
        tlength = length(float(eewwarn.json()['Latitude']), float(eewwarn.json()['Longitude']))

        #修正时间，按横波（取4km/s）抵达时间计算
        timeArray = time.strptime(eewwarn.json()['OriginTime'], "%Y-%m-%d %H:%M:%S")
        timeStamp = time.mktime(timeArray)
        arrivetime = tlength / 4 - int(time.time() - timeStamp)

        #计算本地烈度
        localmagnitude = 0.92 + 1.63 * float(eewwarn.json()['Magunitude']) - 3.49 * math.log10(tlength)
        if localmagnitude <= 0:
            localmagnitude = 0.0
        elif localmagnitude < 12:
            localmagnitude = int(localmagnitude * 10) / 10.0    #保留1位小数
        elif localmagnitude >= 12:
            localmagnitude = 12.0
        
        if arrivetime > 0:
            eewinfo = [eewwarn.json()['HypoCenter'], str(eewwarn.json()['Magunitude']), str(int(tlength)), str(localmagnitude), str(int(arrivetime))]
            return eewinfo
            # msg = eewwarn.json()['HypoCenter'] + "(" + str(eewwarn.json()['Latitude']) + ", " + str(eewwarn.json()['Longitude']) + ")于" + eewwarn.json()['OriginTime'] + "发生" + str(eewwarn.json()['Magunitude']) + "级地震, " + "距离震中" + str(int(tlength)) + "km" + "   估计本地烈度" + str(localmagnitude) + "级 " + "    预计抵达时间(S波)" + str(int(arrivetime)) + "s"
        else:
            eewinfo = [eewwarn.json()['HypoCenter'], str(eewwarn.json()['Magunitude']), str(int(tlength)), str(localmagnitude), "抵达"]
            return eewinfo
        
UDTWinfo = {}
UDTWinfo['cenc'] = cenc()
UDTWinfo['eew'] = sc_eew()
print(json.dumps(UDTWinfo))