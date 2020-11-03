/// Created with Android Studio
/// User: wesley
/// Time: 2020/11/3 15:06
/// Email: 1124700977@qq.com
/// Des: 
import 'package:flutter/material.dart';
import 'package:flutter_demos/cases/clip_tabbar/clip_widget.dart';

class CliperTabbar extends StatefulWidget {
  @override
  _CliperTabbarState createState() => _CliperTabbarState();
}

class _CliperTabbarState extends State<CliperTabbar> {
  List<Widget> pages = [
    Text('首页'),
    Text('广场'),
    Text('添加'),
    Text('收藏'),
    Text('我的'),
  ];
  int _currentIndex = 0;
  Color _activeStyle = Colors.blue;
  Color _style = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('切割实现不规则TabBar'),
      ),
      body: Stack(
        //定位
        children: [
          Positioned(
            child: pages[_currentIndex],
            top: 0,
            left: 0,
            right: 0,
          ),
          Positioned(
              right: 0,
              bottom: 0,
              left: 0,
              child: Column(
                children: [
                  ClipPath(
                    clipper: Clipper(),
                    child: Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  _currentIndex = 0;
                                });
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.home,
                                        color: _currentIndex==0
                                            ? _activeStyle
                                            : _style),
                                    Text(
                                      '首页',
                                      style: TextStyle(
                                          color: _currentIndex==0
                                              ? _activeStyle
                                              : _style),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  _currentIndex = 1;
                                });
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.cached,
                                        color: _currentIndex==1
                                            ? _activeStyle
                                            : _style),
                                    Text(
                                      '广场',
                                      style: TextStyle(
                                          color: _currentIndex==1
                                              ? _activeStyle
                                              : _style),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            flex: 1,
                          ),
                          Expanded(child: FloatingActionButton(
                            splashColor: Colors.transparent,
                            highlightElevation: 0,
                            onPressed: () {
                              setState(() {
                                _currentIndex = 2;
                              });
                            },
                            child: Icon(Icons.add,
                                color: _currentIndex==2 ? Colors.white : _style),
                            elevation: 0,
                          ),flex: 1,),

                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  _currentIndex = 3;
                                });
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.collections,
                                        color: _currentIndex==3
                                            ? _activeStyle
                                            : _style),
                                    Text(
                                      '收藏',
                                      style: TextStyle(
                                          color: _currentIndex==3
                                              ? _activeStyle
                                              : _style),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  _currentIndex = 4;
                                });
                              },
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.person_outline,
                                        color: _currentIndex==4
                                            ? _activeStyle
                                            : _style),
                                    Text(
                                      '我的',
                                      style: TextStyle(
                                          color: _currentIndex==4
                                              ? _activeStyle
                                              : _style),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      height: 80,
                      decoration:
                      BoxDecoration(color: Colors.yellow, boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 15.0), //阴影偏移量 xy
                            blurRadius: 15.0, //阴影模糊程度
                            spreadRadius: 5.0 //阴影扩散程度
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      height: MediaQuery.of(context).padding.bottom,
                      color: Colors.yellow,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}