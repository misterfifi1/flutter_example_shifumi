import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GamePage extends StatefulWidget {
  GamePage({Key key, this.username}) : super(key: key);
  final String username;

  @override
  _GamePageState createState() {
    SystemChrome.setEnabledSystemUIOverlays ([]);
    return _GamePageState();
  }
}

class _GamePageState extends State<GamePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: new Column(
        children: <Widget>[
          Text(
            widget.username,
            style: Theme.of(context).textTheme.headline,
          )
        ],
      ),
    );
  }
}