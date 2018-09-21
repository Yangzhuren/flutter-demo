import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_djt/page/welcome.dart';
import 'package:flutter_djt/page/login.dart';
import 'package:flutter_djt/page/home/farm/farmHome.dart';
import 'package:flutter_djt/util/http.dart';
import 'api.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // 初始化
  void _init() {
    HttpUtil.init(Api.baseUrl, Api.isDebug);
  }

  @override
  Widget build(BuildContext context) {
    _init();
    return new MaterialApp(
      title: '动检通',
      theme: new ThemeData(
        primaryColor: Color.fromARGB(255, 8, 169, 249),
        accentColor: Color.fromARGB(255, 5, 152, 225),
        backgroundColor: Color.fromRGBO(241, 241, 241, 1.0),
        brightness: Brightness.light,
      ),
      home: new Welcome(),
      routes: {
        'login': (BuildContext context) => new Login(),
        'farmHome': (BuildContext context) => new FarmHome(),
      },
    );
  }
}
