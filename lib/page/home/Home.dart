import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shifumi/model/GameType.dart';

import 'UsernameForm.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  String username = "misterfifi";

  void _selectGame(GameType selectedGame) {
    setState(() {
      username = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      backgroundColor: Theme.of(context).backgroundColor,
      body: new Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Text(
              'Your name',
              style: Theme.of(context).textTheme.headline,
            ),
            UsernameForm(),
            Text(
              'Select your Game',
              //style: Theme.of(context).textTheme.body1,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child : Container(
                        color: Colors.indigoAccent,
                        child: Column(
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                debugPrint("Starred Me!");
                              },
                              color: Colors.orangeAccent,
                              icon: new Image.asset('assets/cpu.png'),
                              iconSize: 250,
                              disabledColor: Colors.grey,
                              highlightColor: Colors.black38,
                            ),
                            Text(
                              'HUMAN VS CPU',
                              style: Theme.of(context).textTheme.body1,
                            ),
                          ],
                        ),
                      ),
                    flex: 2,
                  ),
                  Expanded(
                    child : Container(
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              debugPrint("Starred Me!");
                            },
                            color: Colors.orangeAccent,
                            icon: new Image.asset('assets/cpu.png'),
                            iconSize: 250,
                            disabledColor: Colors.grey,
                            highlightColor: Colors.black38,
                          ),
                          Text(
                            'CPU VS CPU',
                            style: Theme.of(context).textTheme.body1,
                          ),
                        ],
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
