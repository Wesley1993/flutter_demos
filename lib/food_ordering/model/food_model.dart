/// Created with Android Studio
/// User: wesley
/// Time: 2020/11/6 15:24
/// Email: 1124700977@qq.com
/// Des:
class Food {
  String name;
  double price;
  double rate;
  int rateCount;
  String image;
  String foodType;

  Food(
      {this.name,
      this.price,
      this.rate,
      this.rateCount,
      this.image,
      this.foodType});
}

List<String> foodTypes = ['All', 'Salad', 'Pizza', 'Asian', 'Burge', 'Dessert'];

List<Food> foods = [
  Food(
      name: 'Vegetable and Poaached Egg',
      price: 10,
      rate: 3.0,
      rateCount: 15,
      image:
          "https://keyassets-p2.timeincuk.net/wp/prod/wp-content/uploads/sites/53/2014/05/Poached-egg-and-bacon-salad-recipe-920x605.jpg",
      foodType: foodTypes[0]),
  Food(
    name: 'Avocado Salad With Mayonoise Soy Sauce',
    price: 20,
    rate: 2,
    rateCount: 25,
    image:
        'https://ifoodreal.com/wp-content/uploads/2018/04/FG-avocado-salad.jpg',
    foodType: foodTypes[0],
  ),
  Food(
    name: 'Pancake With Orange Sauce',
    price: 30,
    rate: 3,
    rateCount: 67,
    image:
        'https://iowagirleats.com/wp-content/uploads/2013/01/OrangePancakes_02_mini.jpg',
    foodType: foodTypes[0],
  ),
  Food(
    name: 'Vegetables Salad',
    price: 40,
    rate: 4,
    rateCount: 29,
    image:
        'https://iowagirleats.com/wp-content/uploads/2016/06/Marinated-Vegetable-Salad-iowagirleats-03.jpg',
    foodType: foodTypes[0],
  ),
];
