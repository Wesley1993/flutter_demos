/// Created with Android Studio
/// User: wesley
/// Time: 2020/11/6 18:03
/// Email: 1124700977@qq.com
/// Des:
import 'package:flutter/material.dart';
import 'package:flutter_demos/food_ordering/pages/food_ordering_home.dart';
import 'package:provider/provider.dart';
import './model/cart_model.dart';

class FoodOrdering extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => Cart(),
      child: MaterialApp(
        title: 'Flutter Food Ordering',
        showSemanticsDebugger: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: FoodOrderingHomePage(),
      ),
    );
  }
}
