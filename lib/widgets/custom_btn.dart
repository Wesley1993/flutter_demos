/// Created with Android Studio
/// User: wesley
/// Time: 2020/11/3 10:14
/// Email: 1124700977@qq.com
/// Des: 自定义按钮
import 'package:flutter/material.dart';

class CustomBtn extends StatefulWidget {
  CustomBtn(
      {Key key,
      @required this.widget,
      @required this.value,
      this.horizontal = 10,
      this.vertical = 10,
      this.textStyle})
      : super(key: key);

  final Widget widget; //案例组件
  final String value; //案例标题
  final double horizontal; //水平内边距
  final double vertical; //垂直内边距
  final TextStyle textStyle; //文本样式

  @override
  _CustomBtnState createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  @override
  Widget build(BuildContext context) {{}
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget.widget));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        padding: EdgeInsets.symmetric(
            horizontal: widget.horizontal, vertical: widget.vertical),
        child: Text(
          widget.value,
          style: widget.textStyle ?? TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
