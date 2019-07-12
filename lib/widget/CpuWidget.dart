import 'package:flutter/material.dart';

class ChoiceWidget extends StatefulWidget {
  _ChoiceWidgetState createState() => _ChoiceWidgetState();
}

class _ChoiceWidgetState extends State<ChoiceWidget>  {


  /// A list of animations representing the stars shown in a horizontal line.
  /// They will be started when the user tabs on one of them.

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Container(

      child: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          child: Container (
            color: Colors.white70,
            child: Image.asset("assets/img/rock.png")
          )
        ),
      ),
    );
  }
}