/// Created with Android Studio
/// User: wesley
/// Time: 2020/11/4 10:21
/// Email: 1124700977@qq.com
/// Des: 文本组件
import 'package:flutter/material.dart';

class TextDemo extends StatefulWidget {
  @override
  _TextDemoState createState() => _TextDemoState();
}

class _TextDemoState extends State<TextDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('文本组件')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Builder(
            //   builder: (BuildContext context) {
            //     RenderBox box = context.findRenderObject();
            //     final Shader linearGradient = LinearGradient(
            //       colors: <Color>[Colors.purple, Colors.blue],
            //     ).createShader(Rect.fromLTWH(
            //         0.0, 0.0, box?.size?.width, box?.size?.height));
            //
            //     return Text(
            //       '老孟，专注分享Flutter技术和应用实战',
            //       style: new TextStyle(
            //           fontSize: 18.0,
            //           fontWeight: FontWeight.bold,
            //           foreground: Paint()..shader = linearGradient),
            //     );
            //   },
            // ),
            RichText(
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <InlineSpan>[
                    WidgetSpan(
                        child: Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.blue),
                      child: Text(
                        '判断题',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                    TextSpan(text: '泡沫灭火器可用于带电灭火'),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
