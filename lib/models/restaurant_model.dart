import 'package:flutter/material.dart';
import 'package:myapp/models/image_model.dart';

class RestaurantModel {
  final String name;
  final String distance;
  final List<ImageModel> images;

  RestaurantModel({ @required this.name, @required this.distance, @required this.images });

  factory RestaurantModel.fromJson(Map<String, dynamic> storeJson) {
    return RestaurantModel(
      name: storeJson['name'],
      distance: storeJson['distance'],
      images: List.from(storeJson['images'] ?? []).map((image) => ImageModel.fromJson(image)).toList(),
    );
  }
}
