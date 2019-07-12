import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 250,
      child: Padding(
        padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
              width: 250.0,
              child: ScaleAnimatedTextKit(
                  duration: Duration(milliseconds: 5000),
                  isRepeatingAnimation: false,
                  onTap: () {
                    print("Tap Event");
                  },
                  text: [
                    "Are",
                    "You",
                    "Ready?"
                  ],
                  textStyle: TextStyle(
                      fontSize: 70.0,
                      fontFamily: "Canterbury"
                  ),
                  textAlign: TextAlign.start,
                  alignment: AlignmentDirectional.topStart // or Alignment.topLeft
              ),
            ),
            ]
        ),
      ),
    );
  }
}