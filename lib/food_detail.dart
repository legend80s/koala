import 'package:flutter/material.dart';

class StoreModel {
  final String name;
  final String distance;

  StoreModel({ @required this.name, @required this.distance });

  factory StoreModel.fromJson(Map<String, dynamic> storeJson) {
    return StoreModel(name: storeJson['name'], distance: storeJson['distance']);
  }
}

class ImageModel {
  final String src;
  final num ratio;

  ImageModel({ @required this.src, @required this.ratio });

  factory ImageModel.fromJson(Map<String, dynamic> imageJson) {
    return ImageModel(src: imageJson['src'], ratio: imageJson['ratio']);
  }
}

class FoodModel {
  final String name;
  final StoreModel store;
  final int orderedCount;
  final ImageModel image;

  FoodModel({ @required this.name, @required this.store, @required this.orderedCount, @required this.image });

  factory FoodModel.fromJson(Map<String, dynamic> foodJson) {
    return FoodModel(
      name: foodJson['name'],
      orderedCount: foodJson['ordered_count'],
      store: StoreModel.fromJson(foodJson['store']),
      image: ImageModel.fromJson(foodJson['image']),
    );
  }
}

class FoodDetail extends StatelessWidget {
  FoodDetail(this.food);

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
      ),
      body: Center(
        child: Text('Hello World', style: TextStyle(fontSize: 32.0)),
      ),
    );
  }
}
