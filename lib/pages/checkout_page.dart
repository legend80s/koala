import 'package:flutter/material.dart';
import 'package:myapp/models/food_model.dart';

class CheckoutPage extends StatelessWidget {
  final FoodModel food;

  CheckoutPage(this.food);

  @override
  Widget build(BuildContext context) {
    print('food.images ${food.images.length}');

    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(4, 4, food.images.length > 1 ? 0 : 4, 4),
        children: <Widget>[
          Text('Food checkout counter'),
          Text('Food: $food'),
        ],
      )
    );
  }
}
