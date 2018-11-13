import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:myapp/home_app_bar.dart';
import 'package:myapp/random_words.dart' show RandomWords, biggerFont;

class Home extends StatelessWidget {
  final title;
  final _randomWords = new RandomWords();

  Home({ this.title });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(title: title, onPress: () => this._pushSaved(context)),
      body: _randomWords
    );
  }

  void _pushSaved(BuildContext context) {
    final Iterable<ListTile> tiles = _randomWords.saved.map((WordPair pair) =>
      ListTile(
        contentPadding: EdgeInsets.all(14.0),
        title: Text(
          pair.asPascalCase,
          style: biggerFont
        )
      )
    );

    final List<Widget> divided = ListTile.divideTiles(
      tiles: tiles,
      context: context
    ).toList();

    Navigator.of(context)
      .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new Scaffold(
        appBar: AppBar(
          title: Text('Saved Suggestions'),
          // backgroundColor: new Color(0xfff8faf8),
        ),
        body: new ListView(children: divided),
      );
    }));
  }
}
