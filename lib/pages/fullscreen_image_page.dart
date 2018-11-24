import 'package:flutter/material.dart';
import 'package:myapp/models/image_model.dart';

class FullscreenImage extends StatelessWidget {
  final ImageModel _image;

  FullscreenImage(image) : _image = image;

  @override
  Widget build(BuildContext context) {
    return Image.network(_image.src, fit: BoxFit.fitWidth);
  }
}
