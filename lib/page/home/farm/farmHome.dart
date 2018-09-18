import 'package:flutter/material.dart';
import 'package:flutter_djt/page/home/common/news.dart';
import 'package:flutter_djt/page/home/farm/marketTrends.dart';

class _FarmHomeState extends State<FarmHome> {
  PageController _controller;
  int _currentIndex = 0;
  final List<BottomNavBean> _bottomNavs = [
    new BottomNavBean('首页', Icons.home),
    new BottomNavBean('行情', Icons.insert_chart),
    new BottomNavBean('任务', Icons.work),
    new BottomNavBean('百科', Icons.laptop_chromebook),
    new BottomNavBean('我的', Icons.account_box),
  ];
  final List<Widget> _pages = [
    new NewsList(),
    new MarketTrends(),
    new NewsList(),
    new NewsList(),
    new NewsList(),
  ];

  @override
  void initState() {
    _controller = new PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemCount: 5,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        onTap: (index) {
          if (_currentIndex != index)
            this.setState(() {
              _currentIndex = index;
            });
          _controller.animateToPage(index,
              duration: new Duration(milliseconds: 500),
              curve: new ElasticOutCurve(0.8));
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Theme.of(context).primaryColor,
        items: _bottomNavs.map((nav) {
          return new BottomNavigationBarItem(
              icon: new Icon(
                nav.icon,
                color: Colors.black54,
              ),
              activeIcon: new Icon(
                nav.icon,
                color: Theme.of(context).primaryColor,
              ),
              title: new Text(nav.title));
        }).toList(),
      ),
    );
  }
}

class FarmHome extends StatefulWidget {
  State createState() {
    return new _FarmHomeState();
  }
}

class BottomNavBean {
  String _title;
  IconData _icon;

  BottomNavBean(this._title, this._icon);

  String get title => _title;

  IconData get icon => _icon;
}
