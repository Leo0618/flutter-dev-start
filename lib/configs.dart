import 'package:flutter/material.dart';
import 'package:flutter_dev_start/IO.dart';
import 'package:flutter_dev_start/main.dart';
import 'package:flutter_dev_start/widgets_hint.dart';
import 'package:flutter_dev_start/widgets_progressbar.dart';

class Configs {}

class AppRoute {
  static const String home = '/';
  static const String hint = '/hint';
  static const String progress = '/progress';
  static const String io = '/io';

  ///路由定义列表
  static Map<String, WidgetBuilder> routes = {
    home: (BuildContext context) => new MyHomePage(title: 'Flutter Dev Start'),
    hint: (BuildContext context) => new HintWidgetsDemo(),
    progress: (BuildContext context) => new ProgressBarWidgetsDemo(),
    io: (BuildContext context) => new ReadAndWriteDemo(),
  };
}
