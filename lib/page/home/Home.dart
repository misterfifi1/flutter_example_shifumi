import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shifumi/model/GameType.dart';
import 'package:shifumi/shape/CustomShape.dart';
import 'package:shifumi/util/HexColor.dart';
import 'package:shifumi/widget/GameSelectionWidget.dart';

import 'package:shifumi/widget/UsernameForm.dart';

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

  //F2AA52
  //EF4D6C

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      body: Container(
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              HexColor("F2AA52"),
              HexColor("F2A653"),
              HexColor("EF5769"),
              HexColor("EE4B6D"),
            ],
          ),
        ),

          child: new Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              child: Row (
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        'Select your mode',
                        style: Theme.of(context).textTheme.headline,
                      ),
                    ),
                  ),
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: GameSelectionWidget(
                onPressedCallback: () {
                  debugPrint("Tapped Me");
                },
                buttonTitle: "Play Now!",
                foregroundImage: AssetImage('assets/img/player.png'),
                subTitle: "Human VS CPU",
              ),
              flex: 3,
            ),
            Expanded(
              child: GameSelectionWidget(
                onPressedCallback: () {
                  debugPrint("Tapped Me");
                },
                buttonTitle: "Watch Game",
                foregroundImage: AssetImage('assets/img/cpu_player.png'),
                subTitle: "CPU VS CPU",
              ),
              flex: 3,
            )
          ],
        )),
      ),
      ),
    );
  }
}
