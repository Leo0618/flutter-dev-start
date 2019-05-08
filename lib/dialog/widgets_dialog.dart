import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_start/comm_listview.dart';
import 'package:flutter_dev_start/dialog/dialog_custom_message.dart';
import 'package:flutter_dev_start/dialog/dialog_loading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _scaffoldkey = new GlobalKey<ScaffoldState>();

    List<ListItem> datas = createList(_scaffoldkey, context);

    return new Scaffold(
        key: _scaffoldkey,
        appBar: new AppBar(
          leading: new BackButton(),
          title: new Text('Dialog的使用'),
          centerTitle: true,
        ),
        body: new CommListView(items: datas));
  }

  List<ListItem> createList(GlobalKey<ScaffoldState> scaffoldkey, BuildContext context) {
    List<ListItem> datas = [
      new ListItem(
          txt: 'SimpleDialog',
          onTap: () {
            showSampleDialog(context);
          }),
      new ListItem(
        txt: 'AlertDialog',
        onTap: () {
          showAlertDialog(context);
        },
      ),
      new ListItem(
        txt: 'LoadingDialog',
        onTap: () {
          showLoadingDialog(context);
        },
      ),
      new ListItem(
        txt: 'CustomMessageDialog',
        onTap: () {
          showCustomMessageDialog(context);
        },
      ),
      new ListItem(
        txt: 'CupertinoAlertDialog',
        onTap: () {
          showCupertinoAlertDialog(context);
        },
      ),
    ];
    return datas;
  }

  //提示 SimpleDialog
  void showSampleDialog(BuildContext context) {
    showDialog<Null>(
        context: context,
        builder: (BuildContext c) {
          return new SimpleDialog(
            title: Text('SimpleDialog'),
            children: <Widget>[new Text('this is content')],
          );
        });
  }

  //提示 AlertDialog
  void showAlertDialog(BuildContext context) {
    showDialog<Null>(
        context: context,
        barrierDismissible: false, //不允许点击外部区域关闭
        builder: (_) => new AlertDialog(
                title: new Text("Dialog 标题"),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('这是个对话框你知道吗？'),
                      Text('不知道就算了'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("取消"),
                    onPressed: () {
                      Fluttertoast.showToast(msg: '取消');
                      Navigator.of(context).pop();
                    },
                  ),
                  new FlatButton(
                    child: new Text("确定"),
                    onPressed: () {
                      Fluttertoast.showToast(msg: '确定');
                      Navigator.of(context).pop();
                    },
                  ),
                ]));
  }

  //提示 LoadingDialog
  void showLoadingDialog(BuildContext context) {
    showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new LoadingDialog(
            text: '加载中...',
            backgroundColor: Colors.white,
            textColor: Colors.teal,
          );
        });
    //延迟3秒关闭loading
    Future.delayed(const Duration(seconds: 3), () => {Navigator.pop(context)});
  }

  //提示 自定义消息对话框
  void showCustomMessageDialog(BuildContext context) {
    showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new CustomMessageDialog(
            title: '官方通知',
            message: '这里是消息内容',
            negativeText: '取消',
            positiveText: '确定',
            onCloseNegative: () {
              Fluttertoast.showToast(msg: '取消');
              Navigator.pop(context);
            },
            onClosePositive: () {
              Fluttertoast.showToast(msg: '确定');
              Navigator.pop(context);
            },
            onCloseTitleButton: () {
              Fluttertoast.showToast(msg: '关闭');
              Navigator.pop(context);
            },
          );
        });
  }

  //提示 Cupertino对话框
  void showCupertinoAlertDialog(BuildContext context) {
    showDialog<bool>(
        context: context,
        barrierDismissible: false, //不允许点击外部区域关闭
        builder: (context) => new CupertinoAlertDialog(
                title: new Text("Dialog 标题"),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text('这是个对话框你知道吗？'),
                      Text('不知道就算了'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  new CupertinoButton(
                    child: new Text("取消"),
                    onPressed: () {
                      Fluttertoast.showToast(msg: '取消');
                      Navigator.of(context).pop(false);
                    },
                  ),
                  new CupertinoButton(
                    child: new Text("确定"),
                    onPressed: () {
                      Fluttertoast.showToast(msg: '确定');
                      Navigator.of(context).pop(true);
                    },
                  ),
                ])).then((bool data) {
      print('data===>$data');
    });
  }
}
