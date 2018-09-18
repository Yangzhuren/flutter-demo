import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('新闻列表'),
          centerTitle: true,
        ),
        body: new Center(
          child: new Text('news'),
        ));
  }
}
