import 'package:flutter/material.dart';

import 'HexColor.dart';

class Util {
  static Util _instance;

  List<Color> backgroundGradient = [
    // Colors are easy thanks to Flutter's Colors class.
    HexColor("F2AA52"),
    HexColor("F2A653"),
    HexColor("EF5769"),
    HexColor("EE4B6D"),
  ];

  factory Util() => _instance ??= new Util._();
  Util._();

}