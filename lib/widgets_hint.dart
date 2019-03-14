import 'package:flutter/material.dart';
import 'package:flutter_dev_start/comm_listview.dart';
import 'package:flutter_dev_start/dialog/widgets_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

//提示类控件示例
class HintWidgetsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _scaffoldkey = new GlobalKey<ScaffoldState>();

    List<ListItem> datas = createList(_scaffoldkey, context);

    return new Scaffold(
        key: _scaffoldkey,
        appBar: new AppBar(
          leading: new BackButton(),
          title: new Text('各种提示类控件'),
          centerTitle: true,
        ),
        body: new CommListView(items: datas));
  }

  List<ListItem> createList(GlobalKey<ScaffoldState> _scaffoldkey, BuildContext context) {
    List<ListItem> datas = [
      new ListItem(
          txt: 'Toast的使用',
          onTap: () {
            Fluttertoast.showToast(msg: '弹个Toast', textColor: Colors.teal, toastLength: Toast.LENGTH_SHORT);
          }),
      new ListItem(
          txt: 'SnackBar',
          onTap: () {
            final snackBar = new SnackBar(
              // SnackBar的主体内容
              content: new Text(
                '这是一个SnackBar',
                style: new TextStyle(color: Colors.white, fontSize: 18),
              ),
              // 显示的时间
              duration: new Duration(seconds: 2),
              backgroundColor: Colors.teal,
              // 交互动作
              action: new SnackBarAction(
                label: '取消',
                textColor: Colors.white,
                onPressed: () {
                  Fluttertoast.showToast(msg: '点击了取消');
                },
              ),
            );
            _scaffoldkey.currentState.showSnackBar(snackBar);
          }),
      new ListItem(
          txt: 'Dialog的使用',
          onTap: () {
            Navigator.push(context, new MaterialPageRoute(builder: (BuildContext c) => new DialogDemo()));
          }),
    ];
    return datas;
  }
}
