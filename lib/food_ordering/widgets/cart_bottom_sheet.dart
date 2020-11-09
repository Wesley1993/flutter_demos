/// Created with Android Studio
/// User: wesley
/// Time: 2020/11/9 10:59
/// Email: 1124700977@qq.com
/// Des:

//dart sdk内的库

//flutter内的库
import 'package:flutter/material.dart';
import 'package:flutter_demos/food_ordering/pages/checkout_page.dart';

//第三库
import 'package:provider/provider.dart';
//自己的库
//相对路径引用
import '../constants/colors.dart';
import '../model/cart_model.dart';
import '../model/food_model.dart';

class CartBottomSheet extends StatelessWidget {
  final titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  final titleStyle1 = TextStyle(fontSize: 16);
  final titleStyle2 = TextStyle(fontSize: 18, color: Colors.black54);
  final titleStyle4 = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Container(
              width: 90,
              height: 8,
              decoration: ShapeDecoration(
                  shape: StadiumBorder(), color: Colors.black26),
            ),
          ),
          buildTitle(cart),
          Divider(),
          if (cart.cartItems.length <= 0)
            noItemWidget()
          else
            buildItemsList(cart),
          Divider(),
          buildPriceInfo(cart),
          SizedBox(height: 8),
          addToCartButton(cart, context)
        ],
      ),
    );
  }

  Widget buildTitle(cart) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Your Order',
          style: titleStyle,
        ),
        IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: cart.clearCart,
        )
      ],
    );
  }

  Widget noItemWidget() {
    return Expanded(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'No items in cart !!',
            style: titleStyle2,
          ),
          SizedBox(
            height: 16,
          ),
          Icon(
            Icons.remove_shopping_cart,
            size: 64,
          )
        ],
      ),
    ));
  }

  Widget buildItemsList(Cart cart) {
    return Expanded(
        child: ListView.builder(
            itemCount: cart.cartItems.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(cart.cartItems[index].food.image)),
                  title: Text(
                    '${cart.cartItems[index].food.name}',
                    style: titleStyle4,
                  ),
                  subtitle: Text('\$ ${cart.cartItems[index].food.price}'),
                  trailing: Text('x ${cart.cartItems[index].quantity}'),
                ),
              );
            }));
  }

  Widget buildPriceInfo(Cart cart) {
    return Row();
  }

  Widget addToCartButton(cart, context) {
    return Center(
      child: RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 64, vertical: 12),
          color: mainColor,
          shape: StadiumBorder(),
          child: Text(
            'Add to Cart',
            style: titleStyle1,
          ),
          onPressed: cart.cartItems.length == 0
              ? null
              : () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CheckOutPage()));
                }),
    );
  }
}
