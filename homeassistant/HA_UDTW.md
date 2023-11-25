# 配置Homeassistant传感器

1) 编辑 `configuration.yaml` , 加入
```
sensor: !include sensor.yaml
```

2) 在 `configuration.yaml` 同目录下添加`/homeassistant`中全部文件(只复制文件)

3) 编辑`haudtw.py`
```
location = [31.75803, 117.253804]    #你的坐标 [纬度, 经度] 默认为 合肥一六八中学
```

4) 重启homeassistant

## 注：
1) 重载yaml配置文件可能无法生效, 必须重启
2) 地震预警使用 `api.wolfx.jp` 公共API 