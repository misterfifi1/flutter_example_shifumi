import 'package:flutter/material.dart';
import 'package:shifumi/page/HomePage.dart';

void main() => runApp(ShifumiApp());

class ShifumiApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shifumi',
      //debugShowMaterialGrid: true,
      //debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.orange,
          errorColor: Colors.redAccent,
          textTheme: TextTheme(
              headline: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 8.0,
                    color: Colors.white70,
                    offset: Offset(-8.0, -8.0),
                  ),
                ],
              ),
              title: TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).accentColor),
              body1: TextStyle(fontSize: 12.0, color: Colors.white),
              body2: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Theme.of(context).accentColor,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.white70,
                    offset: Offset(-4.0, -4.0),
                  ),
                ],
              ),
              caption: TextStyle(
                  fontSize: 8.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.black45),
              subhead: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic))),

      home: HomePage(title: 'Shifumi'),
    );
  }
}
