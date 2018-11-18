import 'package:flutter/material.dart';
import 'package:myapp/models/image_model.dart';
import 'package:myapp/models/store_model.dart';

class FoodModel {
  final String name;
  final StoreModel store;
  final int orderedCount;
  final List<ImageModel> images;

  FoodModel({ @required this.name, @required this.store, @required this.orderedCount, @required this.images });

  factory FoodModel.fromJson(Map<String, dynamic> foodJson) {
    return FoodModel(
      name: foodJson['name'],
      orderedCount: foodJson['ordered_count'],
      store: StoreModel.fromJson(foodJson['store']),
      images: List.from(foodJson['images']).map((image) => ImageModel.fromJson(image)).toList(),
    );
  }
}
