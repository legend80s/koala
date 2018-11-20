import 'package:flutter/material.dart';
import 'package:myapp/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter 2, I am your title',
      debugShowCheckedModeBanner: false,

//      theme: ThemeData(
//        primaryColor: new Color(0xfff8faf8),
//        primaryTextTheme: TextTheme(
//          title: TextStyle(color: Colors.black, fontFamily: "Lato")
//        )
//      ),

      home: new Home(title: 'Koala'),
    );
  }
}
