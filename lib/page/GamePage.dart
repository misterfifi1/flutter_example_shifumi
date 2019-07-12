import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shifumi/model/GameType.dart';
import 'package:shifumi/shape/TimerPainter.dart';
import 'package:shifumi/util/Util.dart';
import 'package:shifumi/widget/CpuWidget.dart';
import 'package:shifumi/widget/ResultWidget.dart';
import 'package:shifumi/widget/WelcomeWidget.dart';

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

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(child: ResultWidget(isWon: false));
        });
  }

  void _startController() {
    if (controller.isAnimating)
      controller.stop();
    else {
      controller.reverse(
          from: controller.value == 0.0
              ? 1.0
              : controller.value);
    }
  }

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.gameType == GameType.HUMAN_VS_CPU) {
      //TODO finir le taf
    }

    _startController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          //_settingModalBottomSheet(context);
          _startController();
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
                child: FlareActor('assets/anim/robot.flr', animation: 'activate'),
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
                            "Hurry UP!",
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
                    Expanded(
                      child: ChoiceWidget(),
                      flex: 1,
                    ),
                    Expanded(
                      child: ChoiceWidget(),
                      flex: 1,
                    ),
                    Expanded(
                      child: ChoiceWidget(),
                      flex: 1,
                    ),
                  ],
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
