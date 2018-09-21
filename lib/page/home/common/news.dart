import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('公告'),
          centerTitle: true,
        ),
        body: new Center(
          child: new Text('news'),
        ));
  }
}
