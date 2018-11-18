import 'package:flutter/material.dart';

class StoreModel {
  final String name;
  final String distance;

  StoreModel({ @required this.name, @required this.distance });

  factory StoreModel.fromJson(Map<String, dynamic> storeJson) {
    return StoreModel(name: storeJson['name'], distance: storeJson['distance']);
  }
}
