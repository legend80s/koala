import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:myapp/food_detail.dart';

// TODO typedef food = Map<string, string>
// TODO String | Number
// not List<Map<String, Object>> foods otherwise `The operator '[]' isn't defined for the class 'Object'.`
const List<Map<String, dynamic>> foods = [
  {
    'name': 'Chocolate Bread Bars',
    'ordered_count': 35,
    'store': {
      'name': '法式面包店',
      'distance': '1.2 km',
    },
    'images': [
      {
        'src': 'http://img.hb.aicdn.com/f34c2c2b70d2d3aacdf0e3864aad0f6969e53826edd03-NBEyh5_fw658',
        'ratio': 0.66,
      },
      {
        'src': 'http://img.hb.aicdn.com/4b24590fc729b83e4ca01a7215732210fe4e931e10c2d-yFGmAO_fw658',
        'ratio': 0.66,
      },
      {
        'src': 'http://img.hb.aicdn.com/0a8d56cfc7967ef633db3c3b1883942807ede4a537474-di3cRx_fw658',
        'ratio': 0.66,
      },
    ],
  },
  {
    'name': 'Breads',
    'ordered_count': 15,
    'store': {
      'name': '法式面包店',
      'distance': '1.1 km',
    },
    'images': [
      {
        'src': 'http://img.hb.aicdn.com/fa204e95db0881507a41bbe877be06599558850e6f1b5-LENt5Z_fw658',
        'ratio': 1,
      }
    ],
  },
  {
    'name': 'Tea & Bread',
    'ordered_count': 15,
    'store': {
      'name': '法式面包店',
      'distance': '2.0 km',
    },
    'images': [
      {
        'src': 'http://img.hb.aicdn.com/a72e8a87c6a88c3a10a93202a5a1f0e9b9c6ac293fe90-3Xes2R_fw658',
        'ratio': 0.66,
      }
    ],
  },
  {
    'name': 'Bread with Melt Chocolate',
    'ordered_count': 15,
    'store': {
      'name': '法式面包店',
      'distance': '2.0 km',
    },
    'images': [
      {
        'src': 'http://img.hb.aicdn.com/f6a639629b29724a1e2759e1e5c34c1c8b1d1f71656aa-ldSnEW_fw658',
        'ratio': 0.66,
      }
    ],
  },
];

List<StaggeredTile> _staggeredTiles = foods
  .map((food) {
    final ratio = food['images'][0]['ratio'] ?? 0.5;
    final height = (1 / ratio).round();

    return StaggeredTile.count(1, height);
  })
  .toList();

List<Widget> _tiles = foods.map((food) {
  return _FoodTile(food);
}).toList();

class _FoodTile extends StatelessWidget {
  const _FoodTile(this.food);

  final dynamic food;

  @override
  Widget build(BuildContext context) {
    final FoodModel food = FoodModel.fromJson(this.food);
    final src = food.images.elementAt(0).src;

    return new Card(
      color: const Color(0x00000000),
      elevation: 3.0,
      child: new GestureDetector(
        onTap: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new FoodDetail(food);
          }));
        },
        child: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new NetworkImage(src),
              fit: BoxFit.cover,
            ),
            borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
          )
        ),
      ),
    );
  }
}

class Foods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(top: 0),
      child: new StaggeredGridView.count(
        crossAxisCount: 2,
        staggeredTiles: _staggeredTiles,
        children: _tiles,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 2.0,
      )
    );
  }
}
