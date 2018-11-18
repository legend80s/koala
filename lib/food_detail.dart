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

class FoodDetail extends StatelessWidget {
  final FoodModel food;

  FoodDetail(this.food);

  static Widget _renderImages(List<ImageModel> images) {
    Widget gallery;

    // Make single image cover the screen
    if (images.length <= 1) {
      gallery = GestureDetector(
        onTap: () {
          print('image ${images[0]} tapped!');
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
            padding: EdgeInsets.only(right: 4),

            child: new GestureDetector(
              onTap: () {
                print('$img tapped!');
              },
              child: Container(
                child: ClipRRect(
                  child: Image.network(img.src, fit: BoxFit.cover),
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

  static Widget _renderDetail(FoodModel food) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Center(
        child: Text(food.name),
      ),
    );
  }

  static Widget _renderActions(FoodModel food) {
    return Container(
      height: 40,
      margin: EdgeInsets.fromLTRB(0, 40, 4, 0),
      child: RaisedButton(
        onPressed: () {
          print('goto order');
        },
        color: Color(0xffd4edda),
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
      body: ListView(
        padding: EdgeInsets.fromLTRB(4, 4, food.images.length > 1 ? 0 : 4, 4),
        children: <Widget>[
          _renderImages(food.images),
          _renderDetail(food),
          _renderActions(food),
        ],
      )
    );
  }
}
