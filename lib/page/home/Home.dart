import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shifumi/model/GameType.dart';
import 'package:shifumi/util/CustomShape.dart';
import 'package:shifumi/util/HexColor.dart';

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
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Select your Game',
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/player.png'))),
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                    child: Container(
                      child: ClipPath(
                        clipper: CustomShape(),
                        //clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          color: Colors.white70,
                          /*
                          foregroundDecoration: BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.white70,
                                blurRadius: 60.0,
                                spreadRadius: 10.0
                              )
                            ]
                          ),
                          */
                          height: 300,
                          width: 300.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 20.0, bottom: 10),
                                child: RaisedButton(
                                    color: HexColor("4EADF3"),
                                    child: Text(
                                      'Play Now!',
                                      style: Theme.of(context).textTheme.body1,
                                    ),
                                    onPressed: () {
                                      debugPrint("Starred Me!");
                                    },
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(8.0))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              flex: 3,
            ),
            Expanded(
              child: Container(
                foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/cpu_player.png'))
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                    child: Container(
                      child: ClipPath(
                        clipper: CustomShape(),
                        //clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          color: Colors.white70,
                          /*
                          foregroundDecoration: BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.white70,
                                blurRadius: 60.0,
                                spreadRadius: 10.0
                              )
                            ]
                          ),
                          */
                          height: 300,
                          width: 300.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                EdgeInsets.only(left: 20.0, bottom: 10),
                                child: RaisedButton(
                                    color: HexColor("4EADF3"),
                                    child: Text(
                                      'Watch Game',
                                      style: Theme.of(context).textTheme.body1,
                                    ),
                                    onPressed: () {
                                      debugPrint("Starred Me!");
                                    },
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(8.0))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              flex: 3,
            ),
          ],
        )),
      ),
      ),
    );
  }
}
