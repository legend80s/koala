import 'package:flutter/material.dart';
import 'package:myapp/pages/fullscreen_image_page.dart';
import 'package:myapp/models/food_model.dart';
import 'package:myapp/models/image_model.dart';
import 'package:myapp/pages/page_checkout.dart';

typedef onTapCallback = void Function(ImageModel);

class FoodDetail extends StatelessWidget {
  final FoodModel food;

  FoodDetail(this.food);

  static Widget _renderImages(List<ImageModel> images, onTapCallback onTap) {
    Widget gallery;

    // Make single image cover the screen
    if (images.length <= 1) {
      gallery = GestureDetector(
        onTap: () {
          onTap(images[0]);
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: new NetworkImage(images[0].src),
              fit: BoxFit.cover,
            ),

            borderRadius: BorderRadius.all(const Radius.circular(5))
          ),
        )
      );
    } else {
      // Make multiple images scrolled horizontally
      gallery = ListView(
        scrollDirection: Axis.horizontal,
        children: images.map((img) {
          return Container(
            padding: EdgeInsets.only(right: 6),

            child: new GestureDetector(
              onTap: () {
                onTap(img);
              },
              child: Container(
                child: ClipRRect(
                  child: Image.network(img.src, fit: BoxFit.cover, width: 300,),
                  borderRadius: BorderRadius.all(const Radius.circular(5)),
                ),
              ),
            ),
          );
        }).toList(),
      );
    }

    return Container(
      height: 350,
      child: gallery,
    );
  }

  static Widget _renderDetail(FoodModel food, BuildContext context) {
    final store = food.store;
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.attach_money, color: primaryColor,),
                  SizedBox(width: 10,),
                  Text('${food.price.unit} ${food.price.value}'),
                ],
              ),

              Row(
                children: <Widget>[
                  Icon(Icons.location_city, color: primaryColor,),
                  SizedBox(width: 10,),
                  Text(store.name),
                ],
              ),

              Row(
                children: <Widget>[
                  Icon(Icons.location_on, color: primaryColor,),
                  SizedBox(width: 10,),
                  Text(store.distance),
                ],
              ),
            ]
          ),
        ],
      )
    );
  }

  static Widget _renderActions(FoodModel food, BuildContext context) {
    return Container(
      height: 40,
//      margin: EdgeInsets.fromLTRB(0, 40, 4, 0),
      margin: EdgeInsets.all(20),
      child: RaisedButton(
        onPressed: () {
          print('goto order');
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CheckoutPage(food);
          }));
        },
//        color: Color(0xffd4edda),
//        color: Color(0xffc3e6cb),
        child: Text('下单'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('food.images ${food.images.length}');
    
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(),
        child: FloatingActionButton(
          onPressed: () => {},
          child: Icon(Icons.add_shopping_cart),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(4, 4, food.images.length > 1 ? 0 : 4, 4),
        children: <Widget>[
          _renderImages(food.images, (ImageModel img) {
            print('$img tapped!');
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FullscreenImage(img);
            }));
          }),
          _renderDetail(food, context),
          _renderActions(food, context),
        ],
      )
    );
  }
}
