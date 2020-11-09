/// Created with Android Studio
/// User: wesley
/// Time: 2020/11/6 18:10
/// Email: 1124700977@qq.com
/// Des:

// flutter内置库
import 'package:flutter/material.dart';
import 'package:flutter_demos/food_ordering/widgets/cart_bottom_sheet.dart';
import 'package:flutter_demos/food_ordering/widgets/food_card.dart';
//第三方库
import 'package:provider/provider.dart';
//相对引用路径
import '../constants/colors.dart';
import '../model/cart_model.dart';
import '../model/food_model.dart';

class FoodOrderingHomePage extends StatefulWidget {
  @override
  _FoodOrderingHomePageState createState() => _FoodOrderingHomePageState();
}

class _FoodOrderingHomePageState extends State<FoodOrderingHomePage> {
  int value = 0;
  showCart() {
    showModalBottomSheet(
        shape: roundedRecatangle32,
        context: context,
        builder: (context) => CartBottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: <Widget>[
            buildAppBar(),
            buildFoodFilter(),
            buildFoodList(),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    int items = 0;
    Provider.of<Cart>(context).cartItems.forEach((element) {
      items += element.quantity;
    });
    return SafeArea(
        child: Row(
      children: [
        Text(
          'MENU',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        IconButton(icon: Icon(Icons.search), onPressed: null),
        Stack(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: showCart,
            ),
            Positioned(
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(4),
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: mainColor),
                    child: Text(
                      '$items',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )))
          ],
        )
      ],
    ));
  }

  Widget buildFoodFilter() {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        children: List.generate(foodTypes.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChoiceChip(
              selectedColor: mainColor,
              labelStyle: TextStyle(
                  color: value == index ? Colors.white : Colors.black),
              label: Text(foodTypes[index]),
              selected: value == index,
              onSelected: (selected) {
                setState(() {
                  value = selected ? index : null;
                });
              },
            ),
          );
        }),
      ),
    );
  }

  Widget buildFoodList() {
    return Expanded(
        child: GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 6,
          mainAxisSpacing: 12,
          crossAxisSpacing: 16),
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return FoodCard(foods[index]);
      },
    ));
  }
}
