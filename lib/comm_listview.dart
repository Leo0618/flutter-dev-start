import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 一个通用显示数据条目的ListView,参数为ListItem集合，
/// 定义Item为ListItem,参数为条目按钮文本及点击事件
class CommListView extends StatelessWidget {
  const CommListView({Key key, @required this.items}) : super(key: key);

  final List<ListItem> items;

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: items,
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({Key key, @required this.txt, @required this.onTap})
      : super(key: key);

  final String txt;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return new InkWell(child: buildItem(txt), onTap: this.onTap);
  }

  Widget buildItem(var text) {
    return new Container(
      margin: new EdgeInsets.fromLTRB(15, 10, 15, 10),
      padding: new EdgeInsets.fromLTRB(0, 10, 0, 10),
      alignment: Alignment.center,
      constraints: new BoxConstraints.expand(height: 50),
      decoration: new BoxDecoration(
        color: Colors.teal[600],
        borderRadius: new BorderRadius.all(
          const Radius.circular(10.0),
        ),
        // 阴影
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.teal[300],
            offset: new Offset(0.0, 2.0),
            blurRadius: 10.0,
          ),
          new BoxShadow(
            color: Colors.grey,
            offset: new Offset(0.0, 2.0),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: new Text(
        text,
        style: new TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
