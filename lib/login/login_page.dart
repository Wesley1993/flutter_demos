import 'dart:async';

/// Created with Android Studio
/// User: wesley
/// Time: 2020/11/10 10:22
/// Email: 1124700977@qq.com
/// Des:

//dart sdk内的库

//flutter内的库
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//第三库
import 'package:shake_animation_widget/shake_animation_widget.dart';
//自己的库
//相对路径引用

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// 1 点击空白处隐藏键盘 与输入焦点
  ///

  //焦点控制器
  FocusNode _userNameFocusNode = new FocusNode();
  FocusNode _userPasswordFocusNode = new FocusNode();

  //文本编辑控制器
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _userPasswordTextController = TextEditingController();

  //抖动控制器
  ShakeAnimationController _userNameShakeController =
      ShakeAnimationController();
  ShakeAnimationController _userPasswordShakeController =
      ShakeAnimationController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideInputFouce();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('登录'),
        ),

        //编写页面的主体
        body: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(30),
      //线性布局
      child: Column(
        children: [
          buildUserNameWidget(),
          SizedBox(height: 22),
          buildUserPasswordWidget(),
          SizedBox(height: 42),
          buildLoginButton()
        ],
      ),
    );
  }

  ///用户名流控制器
  StreamController<String> _userNameStreamController = new StreamController();
  Widget buildUserNameWidget() {
    return StreamBuilder<String>(
        stream: _userNameStreamController.stream,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return ShakeAnimationWidget(
            //左右抖动
            shakeAnimationType: ShakeAnimationType.LeftRightShake,
            //设置默认不抖动
            isForward: false,
            //抖动控制器
            shakeAnimationController: _userNameShakeController,
            child: TextField(
              //输入控制
              controller: _userNameTextController,
              //焦点控制
              focusNode: _userNameFocusNode,
              //边框修饰
              decoration: InputDecoration(
                  labelText: '用户名',
                  //错误提示接收数据
                  errorText: snapshot.data,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              //键盘回车键
              onSubmitted: (String value) {
                if (checkUserName()) {
                  //校验成功
                  _userNameFocusNode.unfocus();
                  //跳转密码输入框
                  FocusScope.of(context).requestFocus(_userPasswordFocusNode);
                } else {
                  //校验失败 用户名输入框重新获取输入焦点
                  FocusScope.of(context).requestFocus(_userNameFocusNode);
                }
              }, //点击键盘回车键 之后回调此方法
            ),
          );
        });
  }

  //校验输入用户名
  bool checkUserName() {
    //获取输入的用户名
    String userName = _userNameTextController.text;
    if (userName.length == 0) {
      //错误提示
      _userNameStreamController.add('请输入用户名');
      //抖动开始
      _userNameShakeController.start();
      return false;
    } else {
      //错误提示注销
      _userNameStreamController.add(null);
      return true;
    }
  }

  ///密码流控制器
  StreamController<String> _userPasswordStreamController =
      new StreamController();
  Widget buildUserPasswordWidget() {
    return StreamBuilder<String>(
        stream: _userPasswordStreamController.stream,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return ShakeAnimationWidget(
            //左右抖动
            shakeAnimationType: ShakeAnimationType.LeftRightShake,
            //设置默认不抖动
            isForward: false,
            //抖动控制器
            shakeAnimationController: _userPasswordShakeController,
            child: TextField(
              //输入控制
              controller: _userPasswordTextController,
              //焦点控制
              focusNode: _userPasswordFocusNode,
              //边框修饰
              decoration: InputDecoration(
                  labelText: '密码',
                  //错误提示接收数据
                  errorText: snapshot.data,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              //键盘回车键
              onSubmitted: (String value) {
                if (checkUserPassword()) {
                  //校验成功 跳转密码输入框
                  _userPasswordFocusNode.unfocus();
                } else {
                  //校验失败 密码输入框重新获取输入焦点
                  FocusScope.of(context).requestFocus(_userPasswordFocusNode);
                }
              }, //点击键盘回车键 之后回调此方法
            ),
          );
        });
  }

  //校验输入密码
  bool checkUserPassword() {
    //获取输入的用户名
    String userPassword = _userPasswordTextController.text;
    if (userPassword.length < 6) {
      //错误提示
      _userPasswordStreamController.add('请输入正确的密码');
      //抖动开始
      _userPasswordShakeController.start();
      return false;
    } else {
      //错误提示注销
      _userPasswordStreamController.add(null);
      return true;
    }
  }

  /// 隐藏键盘 输入焦点
  void hideInputFouce() {
    //  隐藏键盘
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    //隐藏、输入焦点
    _userNameFocusNode.unfocus();
    _userPasswordFocusNode.unfocus();
  }

  //登录按钮
  Widget buildLoginButton() {
    return Container(
        width: double.infinity,
        height: 42,
        child: ElevatedButton(onPressed: loginButtonFunc, child: Text('登录')));
  }

  //登录方法
  void loginButtonFunc() {
    hideInputFouce();

    bool checkUserNameB = checkUserName();

    bool checkUserPasswordB = checkUserPassword();

    if (checkUserNameB && checkUserPasswordB) {
      //继续后续的操作
    }
  }
}
