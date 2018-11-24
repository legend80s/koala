import 'package:flutter/material.dart';
import 'package:myapp/models/food_model.dart';

class CheckoutPage extends StatelessWidget {
  final FoodModel food;

  CheckoutPage(this.food);
  
  static renderOrderedFoods(List<FoodModel> foods, BuildContext context) {
    final Color primarColor = Theme.of(context).primaryColor;

    return Column(
      children: foods.map((food) {
        const checked = true;

        return GestureDetector(
          onTap: () {
//            food
          },
          child: Stack(
            alignment: const Alignment(0.8, -0.2),
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(8),

                leading: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    food.images[0].src,
                  ),
                ),

                title: Text(food.name),
                subtitle: Text('微辣'),
              ),
              Icon(Icons.check_box, color: primarColor),
            ],
          ),
        );
      }).toList()
    );
  }

  @override
  Widget build(BuildContext context) {
    print('food.images ${food.images.length}');

    return Scaffold(
      appBar: AppBar(
        title: Text('下单'),
      ),
      body: ListView(
//        padding: EdgeInsets.only(top: 8),
        children: <Widget>[
          renderOrderedFoods([food, food], context),
        ],
      )
    );
  }
}
