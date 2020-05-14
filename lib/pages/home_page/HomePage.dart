import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imgs = [
    'https://cn.bing.com/th?id=OHR.BaliRiceHarvest_ZH-CN9267319542_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp',
    'https://cn.bing.com/th?id=OHR.MooseWatching_ZH-CN9115714564_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp',
    'https://cn.bing.com/th?id=OHR.OldPatriarchTree_ZH-CN8818146190_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp',
    'https://cn.bing.com/th?id=OHR.ZebraMom_ZH-CN8693599520_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp'
  ];
  void _onScroll(double offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  double appBarAlpha = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
              },
              child: ListView(
                children: <Widget>[
                  // 轮播图
                  Container(
                    height: 210,
                    child: Swiper(
                      itemCount: imgs.length,
                      autoplay: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          imgs[index],
                          fit: BoxFit.cover,
                        );
                      },
                      pagination: SwiperPagination(),
                    ),
                  ),
                  //
                  Container(
                    height: 1000,
                    color: Colors.amber,
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 20,
                ),
                child: Text('首页'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
