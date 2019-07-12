import 'package:flutter/material.dart';
import 'package:shifumi/model/GameType.dart';
import 'package:shifumi/page/GamePage.dart';
import 'package:shifumi/page/HomePage.dart';

class ResultWidget extends StatelessWidget {

  final bool isWon;
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

    this.resultImage = Image.asset(
      "assets/img/lost.png",
      height: 150,
    );

    this.message = "You lost, do you want to retry?";

    if(this.isWon){
      this.resultImage = Image.asset(
        "assets/img/winner.png",
        height: 150,
      );

      this.message = "Congratulation, you Won!";
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GamePage(
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