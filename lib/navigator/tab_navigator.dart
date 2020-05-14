import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/home_page/HomePage.dart';
import 'package:flutter_trip/pages/my_page/MyPage.dart';
import 'package:flutter_trip/pages/search_page/SearchPage.dart';
import 'package:flutter_trip/pages/travel_page/TravelPage.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController();
  final List<Widget> pages = [
    HomePage(),
    SearchPage(),
    TravelPage(),
    MyPage(),
  ];
  final List<BottomNavigationBarItem> tabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('搜索'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.video_camera),
      title: Text('旅拍'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('我的'),
    ),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: tabs,
        onTap: (int index) {
          _controller.jumpToPage(index);
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
