import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shifumi/model/Choice.dart';
import 'package:shifumi/model/GameResult.dart';

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

  static List<Choice> gameCards = [
    new Choice("Rock", "assets/img/game/rock.png", 0, 2),
    new Choice("Paper", "assets/img/game/paper.png", 1, 0),
    new Choice("Scissor", "assets/img/game/scissors.png", 2, 1),
  ];

  static GameResult makeChoiceForUser(){
    final _random = new Random();
    Choice imposedChoice = Util.gameCards[_random.nextInt(Util.gameCards.length)];
    return imposedChoice.isWinner();
  }


  factory Util() => _instance ??= new Util._();
  Util._();

}