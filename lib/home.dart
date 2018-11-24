import 'package:flutter/material.dart';
import 'package:myapp/pages/foods.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController;
  var _page = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(widget.title),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(),
        child: FloatingActionButton(
          onPressed: () => {},
          child: Icon(Icons.add_shopping_cart),
        ),
      ),
      body: PageView(
        children: <Widget>[
          new Foods(),
          Container(
            color: Colors.redAccent,
          ),
          Container(
            color: Colors.blueAccent,
          ),
        ],
        controller: _pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            title: Text("菜品"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            title: Text("餐厅"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("收藏"),
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }

  ///
  /// Bottom Navigation tap listener
  ///
  void navigationTapped(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}
