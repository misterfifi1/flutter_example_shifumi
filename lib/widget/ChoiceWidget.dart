import 'package:flutter/material.dart';
import 'package:shifumi/model/Choice.dart';

class ChoiceWidget extends StatelessWidget {
  final Choice choice;

  ChoiceWidget({@required this.choice});

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset(this.choice.imagePath),
              Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Text(this.choice.name))
            ],
          ),
        ),
      ),
    );
  }
}
