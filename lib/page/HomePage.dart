import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shifumi/model/GameType.dart';
import 'package:shifumi/util/Util.dart';
import 'package:shifumi/widget/GameSelectionWidget.dart';

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
            colors: Util().backgroundGradient,
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
                gameType: GameType.HUMAN_VS_CPU,
                buttonTitle: "Play Now!",
                foregroundImage: AssetImage('assets/img/player.png'),
                subTitle: "Human VS CPU",
              ),
              flex: 3,
            ),
            Expanded(
              child: GameSelectionWidget(
                gameType: GameType.CPU_VS_CPU,
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
