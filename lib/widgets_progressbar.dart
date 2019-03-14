import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seekbar/flutter_seekbar.dart';

//进度条示例
// ignore: must_be_immutable
class ProgressBarWidgetsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: new BackButton(),
          title: Text('进度条示例'),
          centerTitle: true,
        ),
        body: new SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(10), child: Column(children: widgets)),
        ));
  }

  List<Widget> widgets = <Widget>[
    new Container(padding: const EdgeInsets.all(5.0)),
    //带进度值
    new LinearProgressIndicator(
      value: 0.7,
      backgroundColor: Colors.grey,
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal),
    ),

    new Container(padding: const EdgeInsets.all(5.0)),
    new LinearProgressIndicator(
      backgroundColor: Colors.grey,
      valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal),
    ),

    new Container(padding: const EdgeInsets.all(5.0)),
    // 圆形进度条
    new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new CircularProgressIndicator(
          value: 0.8,
          strokeWidth: 4,
          backgroundColor: Colors.grey,
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal),
        ),
        new Container(padding: const EdgeInsets.all(5.0)),
        new CircularProgressIndicator(
          strokeWidth: 4,
          backgroundColor: Colors.grey,
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.teal),
        ),
      ],
    ),

    new Container(padding: const EdgeInsets.all(5.0)),
    // 刷新进度条
    new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new RefreshProgressIndicator(
          value: 0.5,
          backgroundColor: Colors.blue,
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        ),
        new Container(padding: const EdgeInsets.all(5.0)),
        // 刷新进度条
        new RefreshProgressIndicator(
          backgroundColor: Colors.blue,
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ],
    ),

    //==========================下面是Seekbar , see: https://github.com/LiuC520/flutter_seekbar.git
    new Container(padding: const EdgeInsets.all(5.0)),
    new SeekBarDemo(),
  ];
}

class SeekBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SeekBarDemoState();
  }
}

class _SeekBarDemoState extends State<SeekBarDemo> with SingleTickerProviderStateMixin {
  List<SectionTextModel> sectionTexts = [];

  @override
  void initState() {
    super.initState();
    sectionTexts.add(SectionTextModel(position: 0, text: 'bad', progressColor: Colors.red));
    sectionTexts.add(SectionTextModel(position: 2, text: 'good', progressColor: Colors.yellow));
    sectionTexts.add(SectionTextModel(position: 4, text: 'great', progressColor: Colors.green));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
                width: 200,
                child: SeekBar(
                  progresseight: 10,
                  indicatorRadius: 0.0,
                  value: 0.2,
                  isRound: false,
                )),
            Text(
              "直角",
              textDirection: TextDirection.ltr,
              maxLines: 1,
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                  width: 200,
                  child: SeekBar(
                    progresseight: 5,
                    value: 0.2,
                  )),
              Text(
                "圆角带指示器",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                  width: 200,
                  child: SeekBar(
                    hideBubble: false,
                    progresseight: 5,
                    value: 0.2,
                  )),
              Text(
                "圆角带指示器带气泡",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                  width: 200,
                  child: SeekBar(
                    progresseight: 5,
                    value: 0.5,
                    sectionCount: 5,
                  )),
              Text(
                "带间隔带指示器",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 6),
                  width: 200,
                  child: SeekBar(
                    progresseight: 5,
                    value: 0.5,
                    sectionCount: 4,
                    sectionRadius: 6,
                    sectionColor: Colors.blue,
                  )),
              Text(
                "带间隔画间隔的指示器",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    '-10',
                    textDirection: TextDirection.ltr,
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 4),
                      width: 200,
                      child: SeekBar(
                          progresseight: 5,
                          value: 0.5,
                          min: -10,
                          max: 80,
                          sectionCount: 4,
                          sectionRadius: 6,
                          sectionColor: Colors.blue,
                          hideBubble: false,
                          alwaysShowBubble: true,
                          bubbleRadius: 14,
                          bubbleColor: Colors.purple,
                          bubbleTextColor: Colors.white,
                          bubbleTextSize: 14,
                          bubbleMargin: 4,
                          onValueChanged: (v) {
                            print('当前进度：${v.progress} ，当前的取值：${v.value}');
                          })),
                  Text(
                    '80',
                    textDirection: TextDirection.ltr,
                  )
                ],
              ),
              Text(
                "带间隔带气泡的指示器，气泡",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  width: 200,
                  child: SeekBar(
                    progresseight: 10,
                    value: 0.5,
                    sectionCount: 4,
                    sectionRadius: 5,
                    sectionColor: Colors.blue,
                    sectionUnSelecteColor: Colors.blue[100],
                    showSectionText: true,
                    sectionTextMarginTop: 2,
                    sectionDecimal: 0,
                    sectionTextColor: Colors.black,
                    sectionSelectTextColor: Colors.blue,
                    sectionTextSize: 14,
                  )),
              Text(
                "带带刻度的指示器,可设置刻度的样式和选中的刻度的样式",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  width: 200,
                  child: SeekBar(
                    progresseight: 10,
                    value: 0.5,
                    sectionCount: 4,
                    sectionRadius: 5,
                    sectionColor: Colors.blue,
                    sectionUnSelecteColor: Colors.blue[100],
                    showSectionText: true,
                    sectionTextMarginTop: 2,
                    sectionDecimal: 0,
                    sectionTextColor: Colors.black,
                    sectionSelectTextColor: Colors.blue,
                    sectionTextSize: 14,
                    hideBubble: false,
                    bubbleRadius: 14,
                    bubbleColor: Colors.purple,
                    bubbleTextColor: Colors.white,
                    bubbleTextSize: 14,
                    bubbleMargin: 4,
                    afterDragShowSectionText: true,
                  )),
              Text(
                "带带刻度的指示器,可设置刻度的样式和选中的刻度的样式，拖拽结束显示刻度值，拖拽开始显示气泡",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  width: 200,
                  child: SeekBar(
                    min: -100,
                    max: 200,
                    progresseight: 10,
                    value: 0.75,
                    sectionCount: 4,
                    sectionRadius: 6,
                    showSectionText: true,
                    sectionTexts: [],
                    sectionTextMarginTop: 2,
                    sectionDecimal: 0,
                    sectionTextColor: Colors.black,
                    sectionSelectTextColor: Colors.blue,
                    sectionTextSize: 14,
                    hideBubble: false,
                    bubbleRadius: 14,
                    bubbleColor: Colors.purple,
                    bubbleTextColor: Colors.white,
                    bubbleTextSize: 14,
                    bubbleMargin: 4,
                    afterDragShowSectionText: true,
                  )),
              Text(
                "自定义刻度值显示，带带刻度的指示器,可设置刻度的样式和选中的刻度的样式，拖拽结束显示刻度值，拖拽开始显示气泡",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  width: 200,
                  child: SeekBar(
                    progresseight: 10,
                    value: 0.75,
                    sectionCount: 4,
                    sectionRadius: 6,
                    showSectionText: true,
                    sectionTexts: sectionTexts,
                    sectionTextMarginTop: 2,
                    sectionDecimal: 0,
                    sectionTextColor: Colors.black,
                    sectionSelectTextColor: Colors.blue,
                    sectionTextSize: 14,
                    hideBubble: false,
                    bubbleRadius: 14,
                    bubbleColor: Colors.purple,
                    bubbleTextColor: Colors.white,
                    bubbleTextSize: 14,
                    bubbleMargin: 4,
                    afterDragShowSectionText: true,
                  )),
              Text(
                "自定义刻度值显示，带带刻度的指示器,可设置刻度的样式和选中的刻度的样式，拖拽结束显示刻度值，拖拽开始显示气泡",
                textDirection: TextDirection.ltr,
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ],
    );
  }
}
