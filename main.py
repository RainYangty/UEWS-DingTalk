while True:
    try:
        import time
        import requests
        from dingtalkchatbot.chatbot import DingtalkChatbot
        import math
        import datetime
        from geopy.distance import geodesic
        from threading import Thread
        import pygame

        webhook = 'https://oapi.dingtalk.com/robot/send?access_token=你的token'
        secret = 'SEC...你的密钥'  # 可选：创建机器人勾选“加签”选项时使用
        robot = DingtalkChatbot(webhook, secret=secret)  # 方式二：勾选“加签”选项时使用（v1.5以上新功能）
        location = [29.825287, 106.437485]    #你的坐标 [纬度, 经度] 默认为 重庆北碚
        at_mobiles = ['']    #填写你注册钉钉的手机号码

        lastmd5 = 0
        robot.send_text(msg = str(datetime.datetime.now()) + "地震预警已启动")

        def playsound(file):
            pygame.mixer.init()
            pygame.mixer.music.load(file)
            pygame.mixer.music.play(1)
            while pygame.mixer.music.get_busy():  # 在音频播放为完成之前不退出程序
                return

        def length(seita, fai): #seita:纬度 fai:经度        
            """ R = 6371.0      计算方法参考：https://www.zhihu.com/question/265407371，误差较大
            seita = seita / 180 * math.pi
            fai = fai / 180 * math.pi
            return R * math.acos(math.sin(seita) * math.sin(31.75803 / 180.0 * math.pi) + math.cos(seita) * math.cos(31.75803 / 180.0 * math.pi) * math.cos(117.253804 / 180.0 * math.pi - fai))"""
            distance = geodesic((location[0], location[1]), (seita, fai)).km
            return distance

        def countdown(arrivetime, pos, localmagnitude, startarrti):     #倒计时
            time.sleep(1)
            arrivetime -= 1
            if localmagnitude < 5.0 and startarrti - arrivetime < 4:
                countdown(arrivetime = arrivetime, pos = pos, localmagnitude = localmagnitude, startarrti=startarrti)
                return
            if localmagnitude >= 5.0 and startarrti - arrivetime < 13:
                countdown(arrivetime = arrivetime, pos = pos, localmagnitude = localmagnitude, startarrti=startarrti)
                return
            if localmagnitude < 5.0 and startarrti - arrivetime >= 4 and arrivetime % 10 != 0 and arrivetime % 10 != 9:
                playsound(r"/home/RainYangty/audio/countdown/ding.mp3")   #播放地震倒计时
            if localmagnitude >= 5.0 and startarrti - arrivetime >= 13 and arrivetime % 10 != 0 and arrivetime % 10 != 9:
                playsound(r"/home/RainYangty/audio/countdown/ding.mp3")   #播放地震倒计时
            if arrivetime % 10 == 0 and arrivetime <= 60 and arrivetime > 10:
                playsound(r"/home/RainYangty/audio/countdown/" + str(arrivetime) + ".mp3")   #播放地震倒计时
                print(arrivetime)
                robot.send_text(msg = str(arrivetime) + "s (" + pos + " " + str(localmagnitude) + ")后抵达")
            elif arrivetime <= 10 and arrivetime > 0:
                playsound(r"/home/RainYangty/audio/countdown/" + str(arrivetime) + ".mp3")   #播放地震倒计时
                print(arrivetime)
                robot.send_text(msg = str(arrivetime) + "s (" + pos + " " + str(localmagnitude) + ")后抵达", at_mobiles = at_mobiles)
            elif arrivetime == 0:
                playsound(r"/home/RainYangty/audio/countdown/arrive.mp3")   #播放地震倒计时
                print("抵达")
                robot.send_text(msg = "已 (" + pos + " " + str(localmagnitude) + ")抵达", at_mobiles = at_mobiles)
            if arrivetime <= 0:
                return
            else:
                countdown(arrivetime = arrivetime, pos = pos, localmagnitude = localmagnitude, startarrti=startarrti)
                return

        def countdownau(arrivetime, pos, localmagnitude):     #倒计时
            time.sleep(1)
            arrivetime -= 1
            playsound(r"/home/RainYangty/audio/countdown/ding.mp3")
            if arrivetime <= 0:
                return
            else:
                countdownau(arrivetime = arrivetime)

        err = False     #若网络错误，则设为True，避免重复打印

        playsound(r"/home/RainYangty/audio/update.mp3")    #启动声音
        break
    except:
        continue

def cenc():
    print("cenc")
    #cenc测定播报
    lastmd5 = 0
    while True:
        ctime = int(time.time() * 1000)
        errtime = datetime.datetime.now()   #避免因网络错误产生高延迟 导致反馈错误的时间不准
        err = True
        try:
            eqlist = requests.get("https://api.wolfx.jp/cenc_eqlist.json", timeout = 200) #设置等待时间，若无响应则网络出现问题： https://api.wolfx.jp/cenc_eqlist.json
        except:
            if err == False:
                print(str(errtime) + "网络错误")
                err = True
            time.sleep(1)
            continue
        if eqlist.json()['md5'] != lastmd5:
            playsound(r"/home/RainYangty/audio/cenc.mp3")
            lastmd5 = eqlist.json()['md5']
            etype = ""
            if eqlist.json()['No0']['type'] == "reviewed":
                etype = "正式测定"
            else:
                etype = "自动测定"

            tlength = length(float(eqlist.json()['No0']['latitude']), float(eqlist.json()['No0']['longitude'])) #距离

            localmagnitude = 0.92 + 1.63 * float(eqlist.json()['No0']['magnitude']) - 3.49 * math.log10(tlength) #震级
            if localmagnitude <= 0:
                    localmagnitude = 0.0
            elif localmagnitude < 12:
                localmagnitude = int(localmagnitude * 10) / 10.0    #保留1位小数
            elif localmagnitude >= 12:
                localmagnitude = 12.0

            print(str(datetime.datetime.now()) + " cenc" + etype + "( " + eqlist.json()['No0']['location'] + " 发生地震)距离: " + str(int(tlength)) + " km 本地震级：" + str(localmagnitude))
            robot.send_text(msg = str(datetime.datetime.now()) + " cenc" + etype + "( " + eqlist.json()['No0']['location'] + " 发生地震)距离: " + str(int(tlength)) + " km 本地震级：" + str(localmagnitude), at_mobiles = at_mobiles)
        time.sleep(1)

def sc_eew():
    print("sc_eew")
    eewlastid = 0
    while True:
        ctime = int(time.time() * 1000)
        errtime = datetime.datetime.now()   #避免因网络错误产生高延迟 导致反馈错误的时间不准
        # print("get json")
        try:
            eewwarn = requests.get("https://api.wolfx.jp/sc_eew.json", timeout = 200)   #设置等待时间，若无响应则网络出现问题：https://api.wolfx.jp/sc_eew.json
        except:
            if err == False:
                print(str(errtime) + "网络错误")
                err = True
            time.sleep(1)
            continue
        #eew预警
        if eewwarn.json()['EventID'] != eewlastid:
            #play = Thread(target=playsound, args = (r"/home/RainYangty/audio/cenc.mp3"))    #启动新线程播放地震发现声音
            #play.start()
            playsound(r"/home/RainYangty/audio/update.mp3")

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
                print(str(datetime.datetime.now()) + "时间修正完毕, " + str(int(arrivetime)) + "s 后抵达(S波)")
            else:
                print(str(datetime.datetime.now()) + "时间修正完毕, " + str(int(0 - arrivetime)) + "s 前已抵达(S波)")

            if arrivetime >= -120: #若S波已抵达超过120s则不再反馈
                
                #计算本地震度
                print(str(datetime.datetime.now()) + "计算本地震度")
                localmagnitude = 0.92 + 1.63 * float(eewwarn.json()['Magnitude']) - 3.49 * math.log10(tlength)
                if localmagnitude <= 0:
                    localmagnitude = 0.0
                elif localmagnitude < 12:
                    localmagnitude = int(localmagnitude * 10) / 10.0    #保留1位小数
                elif localmagnitude >= 12:
                    localmagnitude = 12.0
                print(str(datetime.datetime.now()) + "震度为" + str(localmagnitude) + "级")
                
                print(str(datetime.datetime.now()) + "将获取数据发送")
                if arrivetime > 0:
                    arrivetime = tlength / 4 - int(time.time() - timeStamp)     #修正因发送前文导致的时间延时
                    if localmagnitude >= 0.0:
                        #play = Thread(target=playsound, args = (r"/home/RainYangty/audio/cenc.mp3"))    #启动新线程播放有感地震警报
                        #play.start()
                        if localmagnitude >= 5.0:
                            playsound(r"/home/RainYangty/audio/eew2.mp3")
                        else:
                            playsound(r"/home/RainYangty/audio/eew1.mp3")
                        print(print(str(datetime.datetime.now()) + "本地超过 3.0 级，启动倒计时"))
                        count = Thread(target=countdown, args = (int(arrivetime), eewwarn.json()['HypoCenter'], localmagnitude, int(arrivetime)))    #启动新线程倒计时
                        count.start()
                    msg = eewwarn.json()['HypoCenter'] + "(" + eewwarn.json()['Latitude'] + ", " + eewwarn.json()['Longitude'] + ")于" + eewwarn.json()['OriginTime'] + "发生" + eewwarn.json()['Magnitude'] + "级地震, " + "距离震中" + str(int(tlength)) + "km" + "   估计本地" + str(localmagnitude) + "级 " + "    预计抵达时间(S波)" + str(int(arrivetime)) + "s"
                else:
                    msg = eewwarn.json()['HypoCenter'] + "(" + eewwarn.json()['Latitude'] + ", " + eewwarn.json()['Longitude'] + ")于" + eewwarn.json()['OriginTime'] + "发生" + eewwarn.json()['Magnitude'] + "级地震, " + "距离震中" + str(int(tlength)) + "km" + "   估计本地" + str(localmagnitude) + "级 " + "    已抵达(S波) "
                robot.send_text(msg = msg, at_mobiles = at_mobiles)
                print(str(datetime.datetime.now()) + "发送成功")
            else:
                print(str(datetime.datetime.now()) + "抵达时间超过120s, 不再发送")

        
        time.sleep(1)

eqli = Thread(target=cenc)
eewwa = Thread(target=sc_eew)

eqli.start()
eewwa.start()
