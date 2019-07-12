import 'package:flutter/material.dart';
import 'package:shifumi/model/GameResult.dart';
import 'package:shifumi/model/GameType.dart';
import 'package:shifumi/page/GamePage.dart';
import 'package:shifumi/page/HomePage.dart';
import 'package:shifumi/transition/EnterExitRoute.dart';
import 'package:shifumi/transition/FadeRoute.dart';
import 'package:shifumi/transition/ScaleRoute.dart';

class ResultWidget extends StatelessWidget {

  final GameResult isWon;
  final GameType gameType;
  Image resultImage;
  String message;

  ResultWidget({
      @required this.isWon,
      @required this.gameType,
    }
  );

  @override
  Widget build(BuildContext context) {

    switch(this.isWon){
      case GameResult.LOST:
        this.resultImage = Image.asset(
          "assets/img/lost.png",
          height: 150,
        );
        this.message = "You lost, do you want to retry?";
        break;
      case GameResult.WON:
        this.resultImage = Image.asset(
          "assets/img/winner.png",
          height: 150,
        );

        this.message = "Congratulation, you Won!";
        break;
      case GameResult.EQUALITY:
      default:
        this.resultImage = Image.asset(
          "assets/img/equality.png",
          height: 150,
        );

        this.message = "I can't decide, please try again!";
        break;

    }

    return Container(
      height: 250,
      child: Padding(
        padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    this.resultImage
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      this.message,
                      style: Theme.of(context).textTheme.title,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child:
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: RaisedButton(
                            color: Theme.of(context).accentColor,
                            child: Text(
                              "Back to Home",
                              style: Theme.of(context).textTheme.subhead,
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context, ScaleRoute(page: HomePage()),
                              );
                            },
                            shape: new RoundedRectangleBorder(
                                borderRadius:
                                new BorderRadius.circular(8.0))),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child:
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: RaisedButton(
                            color: Theme.of(context).errorColor,
                            child: Text(
                              "Retry?",
                              style: Theme.of(context).textTheme.subhead,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pushReplacement(
                                context,
                                FadeRoute(page: GamePage(
                                    gameType: this.gameType,
                                  ),
                                ),
                              );
                            },
                            shape: new RoundedRectangleBorder(
                                borderRadius:
                                new BorderRadius.circular(8.0))),
                      ),
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}