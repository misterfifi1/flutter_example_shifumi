import 'package:flutter/material.dart';
import 'package:shifumi/model/GameType.dart';
import 'package:shifumi/page/GamePage.dart';
import 'package:shifumi/shape/HomeGameSelectionShape.dart';
import 'package:shifumi/util/HexColor.dart';

class GameSelectionWidget extends StatelessWidget {

  final GameType gameType;
  final String buttonTitle;
  final String subTitle;
  final AssetImage foregroundImage;

  GameSelectionWidget({
      @required this.gameType,
      @required this.buttonTitle,
      @required this.foregroundImage,
      @required this.subTitle
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
          image: DecorationImage(
              image: this.foregroundImage)),
      child: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          child: Container(
            child: ClipPath(
              clipper: HomeGameSelectionShape(),
              //clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                color: Colors.white70,
                height: 300,
                width: 300.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                      EdgeInsets.only(left: 15.0),
                      child: RaisedButton(
                          color: HexColor("4EADF3"),
                          child: Text(
                            this.buttonTitle,
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
                    Padding(
                      padding:
                      EdgeInsets.only(left: 20.0, bottom: 8),
                      child: Text(
                        this.subTitle,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}