import 'package:flutter/material.dart';
import 'package:shifumi/shape/CustomShape.dart';
import 'package:shifumi/util/HexColor.dart';

class GameSelectionWidget extends StatelessWidget {

  final GestureTapCallback onPressedCallback;
  final String buttonTitle;
  final AssetImage foregroundImage;

  GameSelectionWidget({
      @required this.onPressedCallback,
      @required this.buttonTitle,
      @required this.foregroundImage,
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
              clipper: CustomShape(),
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
                      EdgeInsets.only(left: 20.0, bottom: 10),
                      child: RaisedButton(
                          color: HexColor("4EADF3"),
                          child: Text(
                            this.buttonTitle,
                            style: Theme.of(context).textTheme.subhead,
                          ),
                          onPressed: onPressedCallback,
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
    );
  }
}