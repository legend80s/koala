import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final Widget imageSection = Image.asset('images/lake.jpg', height: 230, fit: BoxFit.cover);

final Widget titleSection = Container(
  padding: EdgeInsets.all(32),
  child: Row(
    children: <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 8),
              child: Text('Oechinen Lake Campground', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Text('Kandersteg, Switzerland', style: TextStyle(color: Colors.grey))
          ],
        )
      ),

      Container(
        margin: EdgeInsets.only(right: 4),
        child: Icon(Icons.star, color: Colors.red),
      ),
      Text('41'),
    ],
  ),
);

Column buildButtonColumn(IconData icon, String label, Color color) {
  return Column(
    mainAxisSize: MainAxisSize.max, // @TODO ?
    mainAxisAlignment: MainAxisAlignment.center, // @TODO no need ?

    children: <Widget>[
      Icon(icon, color: color,),

      Container(
        margin: EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ))
      ),
    ],
  );
}

Widget buildButtonSection(BuildContext context) {
  Color themeColor = Theme.of(context).primaryColor;

  return Container(
    padding: EdgeInsets.symmetric(vertical: 16),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        buildButtonColumn(Icons.call, 'CALL', themeColor),
        buildButtonColumn(Icons.near_me, 'ROUTE', themeColor),
        buildButtonColumn(Icons.share, 'SHARE', themeColor),
      ],
    ),
  );
}

final Widget textSection = Container(
  padding: EdgeInsets.all(32),

  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run. Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo - Building Layouts',
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,

      home: Scaffold(
        appBar: AppBar(title: Text('Top Lakes'), centerTitle: true),
        body: ListView(
          children: <Widget>[
            imageSection,
            titleSection,
            buildButtonSection(context),
            textSection,
          ],
        ),
      ),
    );
  }
}
