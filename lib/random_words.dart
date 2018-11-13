import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

const biggerFont = const TextStyle(fontSize: 20);

class RandomWords extends StatefulWidget {
  final saved = Set<WordPair>();

  @override
  RandomWordsState createState() => new RandomWordsState(saved);

//  Set<WordPair> get saved => this.;
}

class RandomWordsState extends State<RandomWords> {
  RandomWordsState(saved) {
    this._saved = saved;
  }

  final _suggestions = <WordPair>[];
  var _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),

        itemBuilder: (context, i) {
          if (i.isOdd) {
            return Divider();
          }

          final index = i ~/ 2;

          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index]);
        });
  }

  _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(pair.asPascalCase, style: biggerFont),

      trailing: Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null
      ),

      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
