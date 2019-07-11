import 'package:flutter/material.dart';
import 'package:shifumi/page/home/Home.dart';

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
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              color: Colors.white
          ),
          body1: TextStyle(
              fontSize: 12.0,
              color: Colors.white
          ),
          subhead: TextStyle(
            fontSize: 12.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic
          )
        )
      ),

      home: HomePage(title: 'Shifumi'),
    );
  }
}
