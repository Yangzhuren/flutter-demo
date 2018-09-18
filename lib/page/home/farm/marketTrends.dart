import 'package:flutter/material.dart';

class MarketTrends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '新闻列表',
          style: new TextStyle(color: Colors.white, fontSize: 24.0),
        ),
        centerTitle: true,
      ),
      body: new Center(child: new Text('trend')),
    );
  }
}
