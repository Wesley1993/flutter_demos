/// Created with Android Studio
/// User: wesley
/// Time: 2020/11/3 14:30
/// Email: 1124700977@qq.com
/// Des: 自定义底部tabbar
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义底部tabbar'),
      ),
      body: SafeArea(
          child: Stack(children: [
        Positioned(
          child: Container(
            color: Colors.yellow,
            width: 100,
            height: 100,
          ),
          left: 0,
          top: 0,
        ),
        Positioned(
          child: Container(
            color: Colors.cyanAccent,
            width: 30,
            height: 30,
          ),
          left: 30,
          top: 50,
        ),
        Positioned(
          child: Text('定位3'),
          bottom: 0,
          right: 30,
        )
      ])),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页')
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
