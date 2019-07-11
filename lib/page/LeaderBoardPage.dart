import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LeaderBoardPage extends StatefulWidget {
  LeaderBoardPage({Key key, this.username}) : super(key: key);
  final String username;

  @override
  _LeaderBoardPageState createState() {
    SystemChrome.setEnabledSystemUIOverlays ([]);
    return _LeaderBoardPageState();
  }
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: new Column(
        children: <Widget>[
          Text(
            'LeaderBoard',
            style: Theme.of(context).textTheme.headline,
          )
        ],
      ),
    );
  }
}