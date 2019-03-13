import 'package:flutter/material.dart';
import 'package:flutter_dev_start/comm_listview.dart';
import 'package:flutter_dev_start/widgets_hint.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Flutter 基本操作'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //创建列表条目集合
    List<ListItem> dataList = createDataList(context);

    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      /*body: new ListView(children: dataList),*/
      body: new CommListView(
        items: dataList,
      ),
    );
  }

  List<ListItem> createDataList(BuildContext context) {
    List<ListItem> dataList = [
      new ListItem(
        txt: '各种提示类控件',
        onTap: () {
          Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => new HintWidgetsDemo()));
        },
      ),
      //TODO
      new ListItem(
        txt: '进度条',
        onTap: () {
          Fluttertoast.showToast(msg: '敬请期待');
        },
      ),
      //TODO
      new ListItem(
        txt: 'IO操作',
        onTap: () {
          Fluttertoast.showToast(msg: '敬请期待');
        },
      ),
    ];
    return dataList;
  }
}
