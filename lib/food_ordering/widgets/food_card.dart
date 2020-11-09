/// Created with Android Studio
/// User: wesley
/// Time: 2020/11/6 18:53
/// Email: 1124700977@qq.com
/// Des:

//dart sdk内的库

//flutter内的库
import 'package:flutter/material.dart';
import 'package:flutter_demos/food_ordering/constants/colors.dart';
import 'package:flutter_demos/food_ordering/model/cart_model.dart';
import 'package:flutter_demos/food_ordering/model/food_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

//第三库
import 'package:provider/provider.dart';
//自己的库
//相对路径引用

class FoodCard extends StatefulWidget {
  final Food food;
  FoodCard(this.food);

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  Food get food => widget.food;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          buildImage(),
          buildTitle(),
          buildRating(),
          buildPriceInfo()
        ],
      ),
    );
  }

  Widget buildImage() {
    return Card(
      shape: roundedRectangele,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        child: Image.network(
          food.image,
          fit: BoxFit.fill,
          height: 100,
          loadingBuilder: (context, Widget child, ImageChunkEvent progress) {
            if (progress == null) return child;
            return Padding(
              padding: EdgeInsets.all(32),
              child: CircularProgressIndicator(
                value: progress.expectedTotalBytes != null
                    ? progress.cumulativeBytesLoaded /
                        progress.expectedTotalBytes
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(top: 12.0, left: 8, right: 16),
      child: Text(
        food.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget buildRating() {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 4, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RatingBar(
              initialRating: food.rate,
              direction: Axis.horizontal,
              itemCount: 5,
              itemSize: 14,
              unratedColor: Colors.black,
              itemPadding: EdgeInsets.only(right: 4),
              ignoreGestures: true,
              itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: mainColor,
                  ),
              onRatingUpdate: (rating) {}),
          Text('${food.rateCount}')
        ],
      ),
    );
  }

  Widget buildPriceInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '\$ ${food.price}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Card(
            margin: EdgeInsets.only(right: 8),
            shape: roundedRectangele,
            color: mainColor,
            child: InkWell(
              onTap: addItemToCard,
              customBorder: roundedRectangele,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  addItemToCard() {
    final snackBar = SnackBar(
      content: Text('${food.name} added to cart'),
      duration: Duration(milliseconds: 300),
    );
    Scaffold.of(context).showSnackBar(snackBar);
    CartModel cartModel = CartModel(food: food, quantity: 1);
    Provider.of<Cart>(context).addItem(cartModel);
  }
}
