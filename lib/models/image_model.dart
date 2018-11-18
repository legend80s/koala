import 'package:flutter/material.dart';

class ImageModel {
  final String src;
  final num ratio;

  ImageModel({ @required this.src, @required this.ratio });

  factory ImageModel.fromJson(Map<String, dynamic> imageJson) {
    return ImageModel(src: imageJson['src'], ratio: imageJson['ratio']);
  }
}
