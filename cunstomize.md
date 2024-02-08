# 自定义API配置

## 注意

1) 仅支持地震速报自定义
2) 仅支持含有特殊校验法用来检测内容变化的API\
如用md5、事件ID（发震时间也可以，但不推荐）
3) 请对API内容负责，UDTW不会承担因自定义API而导致问题产生的任何责任

## 流程
1) 将config.json中false改为true
```
"customize_API": false,
```
2) 对应填就好(本人高一，学业繁忙，实在来不及写详细惹，我错惹)
如若API长这样
```
{
"No1": {
        "type": "reviewed",
        "time": "2024-02-08 11:17:49",
        "location": "新疆克孜勒苏州阿合奇县",
        "magnitude": "3.0",
        "depth": "11",
        "latitude": "41.10",
        "longitude": "78.49"
        }
}
```
那么就填

```
"customize_API": "https://api.wolfx.jp/cenc_eqlist.json",
"md5": "md5",
"warning_type": "type",
"first": "No1",
"reviewed": "reviewed",
"latitude": "latitude",
"longitude": "longitude",
"magnitude": "magnitude",
"location": "location",
"OriginTime": "time"
```