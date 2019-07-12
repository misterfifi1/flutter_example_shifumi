import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shifumi/model/GameType.dart';
import 'package:shifumi/util/Util.dart';
import 'package:shifumi/widget/ChoiceWidget.dart';
import 'package:shifumi/widget/ResultWidget.dart';

import 'HomePage.dart';

class GamePage extends StatefulWidget {
  GamePage({Key key, @required this.gameType}) : super(key: key);
  final GameType gameType;

  @override
  _GamePageState createState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return _GamePageState();
  }
}

class _GamePageState extends State<GamePage> with TickerProviderStateMixin {
  AnimationController controller;
  static const String FLARE_ANIMATION = "Cargando";
  int _timerValue = 10;
  Timer _timer;

  String _ruleMessage = "Make your choice!";

  void _displayResult(context, bool result) {
    _stopTimers();
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              child: ResultWidget(
            isWon: result,
            gameType: widget.gameType,
          ));
        });
  }

  void _startController() {
    if (controller.isAnimating)
      controller.stop();
    else {
      controller.reverse(
          from: controller.value == 0.0 ? 1.0 : controller.value);
    }
  }

  void _stopTimers() {
    _timer.cancel();
    if (controller.isAnimating) controller.stop();
  }

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    if (widget.gameType == GameType.CPU_VS_CPU) {
      _timerValue = 5;
      _ruleMessage = "The CPU is thinking, wait!";
    }

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _timerValue),
    );

    _timer = new Timer(Duration(seconds: _timerValue), () {
      _displayResult(context, Util.makeChoiceForUser());
      this._timer.cancel();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    _startController();

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
              colors: Util().backgroundGradient),
        ),
        child: new Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Row(
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
                child: FlareActor('assets/anim/robot.flr',
                    animation: FLARE_ANIMATION),
                flex: 3,
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: FractionalOffset.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            _ruleMessage,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.body2,
                          ),
                          AnimatedBuilder(
                              animation: controller,
                              builder: (BuildContext context, Widget child) {
                                return Text(
                                  timerString,
                                  style: Theme.of(context).textTheme.body2,
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
                flex: 2,
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    for (var choice in Util.gameCards)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: RaisedButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0)),
                            child: ChoiceWidget(choice: choice),
                            onPressed: () {
                              if (widget.gameType == GameType.HUMAN_VS_CPU) {
                                _displayResult(this.context, choice.isWinner());
                              }
                            },
                            color: Colors.white54,
                            highlightColor: Colors.blueAccent,
                            splashColor: Colors.blueAccent,
                          ),
                        ),
                        flex: 1,
                      ),
                  ],
                ),
                flex: 3,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        "Back to Home",
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      onPressed: () {
                        _stopTimers();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0))),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
