/// Created with Android Studio
/// User: wesley
/// Time: 2020/11/9 15:16
/// Email: 1124700977@qq.com
/// Des:

//dart sdk内的库

//flutter内的库
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//第三库
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
//自己的库
//相对路径引用
import '../constants/colors.dart';
import '../model/cart_model.dart';
import '../model/food_model.dart';

class CheckOutPage extends StatefulWidget {
  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  var titleStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
  var now = DateTime.now();
  get weekDay => DateFormat('EEEE').format(now);
  get day => DateFormat('dd').format(now);
  get month => DateFormat('MMMM').format(now);

  List<Food> displayList = [];
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    displayList.clear();

    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16),
              SafeArea(
                  child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(Icons.arrow_back_ios),
              )),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'Cart',
                  style: titleStyle,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 0),
                child: Text(
                  '$weekDay,${day}th of $month',
                  style: titleStyle,
                ),
              ),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('+ Add to order')),
              ListView.builder(
                  itemCount: cart.cartItems.length,
                  shrinkWrap: true,
                  controller: scrollController,
                  itemBuilder: (BuildContext context, int index) {
                    return buildCartItemList(cart, cart.cartItems[index]);
                  }),
              buildPriceInfo(cart),
              checkoutButton(cart, context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPriceInfo(Cart cart) {
    final titleStyle2 = TextStyle(fontSize: 18);
    double total = 0;
    for (CartModel cart in cart.cartItems) {
      total += cart.food.price * cart.quantity;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Total:',
          style: titleStyle2,
        ),
        Text(
          '\$ ${total.toStringAsFixed(2)}',
          style: titleStyle,
        )
      ],
    );
  }

  Widget checkoutButton(cart, context) {
    final titleStyle1 = TextStyle(fontSize: 16, color: Colors.white);
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 64),
      child: Center(
        child: RaisedButton(
          child: Text(
            'CheckOut',
            style: titleStyle1,
          ),
          onPressed: () {},
          padding: EdgeInsets.symmetric(horizontal: 64, vertical: 12),
          color: mainColor,
          shape: StadiumBorder(),
        ),
      ),
    );
  }

  Widget buildCartItemList(Cart cart, CartModel cartModel) {
    var titleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image.network(cartModel.food.image),
            ),
            flex: 3,
            fit: FlexFit.tight,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    height: 50,
                    child: Text(cartModel.food.name,
                        style: titleStyle, textAlign: TextAlign.center)),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        onTap: () => cart.removeItem(cartModel),
                        child: Icon(Icons.remove_circle)),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child:
                            Text('${cartModel.quantity}', style: titleStyle)),
                    InkWell(
                        onTap: () => cart.increaseItem(cartModel),
                        child: Icon(Icons.add_circle))
                  ],
                )
              ],
            ),
            flex: 5,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    height: 40,
                    width: 70,
                    child: Text('\$ ${cartModel.food.price}',
                        style: titleStyle, textAlign: TextAlign.end)),
                Card(
                  shape: roundedRectangele,
                  color: mainColor,
                  child: InkWell(
                    onTap: () => cart.removeAllInList(cartModel.food),
                    customBorder: roundedRectangele,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            flex: 2,
          )
        ],
      ),
    );
  }
}
