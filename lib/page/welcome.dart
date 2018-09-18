import 'package:flutter/material.dart';
import 'login.dart';
import 'dart:async';

class Welcome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WelcomeState();
  }
}

class WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> images = [
    'images/banner1.png',
    'images/banner2.png',
    'images/banner3.png'
  ];

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    int index = 0;
    Timer _timer;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      ++index;
      if (index == images.length) {
        _jumpToLogin();
        _timer.cancel();
      } else
        _tabController.animateTo(index, duration: Duration(milliseconds: 300));
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _jumpToLogin() {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new Login();
    }));
  }

  Image _createImage(String path) {
    return Image.asset(
      path,
      fit: BoxFit.fill,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        children: images.map((String path) {
          return _createImage(path);
        }).toList(),
        controller: _tabController,
      ),
    );
  }
}
