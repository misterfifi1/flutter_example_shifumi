import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shifumi/model/GameType.dart';
import 'package:shifumi/util/HexColor.dart';
import 'package:shifumi/util/Util.dart';
import 'package:shifumi/widget/CpuWidget.dart';
import 'package:shifumi/widget/ResultWidget.dart';

class GamePage extends StatefulWidget {
  GamePage({Key key, @required this.gameType}) : super(key: key);
  final GameType gameType;

  @override
  _GamePageState createState() {
    SystemChrome.setEnabledSystemUIOverlays ([]);
    return _GamePageState();
  }
}

class _GamePageState extends State<GamePage> {

  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            child: ResultWidget(
                isWon: false)
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    if(widget.gameType == GameType.HUMAN_VS_CPU) {
      //TODO finir le taf
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          _settingModalBottomSheet(context);
        },
        child: new Icon(Icons.add),
      ),
      body: Container(
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: Util().backgroundGradient
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
                              'Are you ready?',
                              style: Theme.of(context).textTheme.headline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: CpuWidget(
                      isTop: false,
                    ),
                    flex: 3,
                  ),
                  Expanded(
                    child: CpuWidget(
                      isTop: false,
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