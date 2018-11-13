import 'package:flutter/material.dart';

AppBar homeAppBar({ title, onPress }) {
  return AppBar(
    title: title,
    centerTitle: true,
    backgroundColor: new Color(0xfff8faf8),
    actions: <Widget>[
      IconButton(icon: Icon(Icons.list), onPressed: onPress)
    ],
  );
}
