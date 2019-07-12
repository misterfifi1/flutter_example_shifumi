import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shifumi/model/GameResult.dart';
import 'package:shifumi/util/Util.dart';

class Choice {

  final String _name;
  final String _imagePath;
  final int _weight;

  Choice(this._name, this._imagePath, this._weight);

  GameResult isWinner(){
    debugPrint("-----------------");
    Choice opponentChoice = this._getRandomOpponentChoice();
    debugPrint(opponentChoice.name + " VS " + this.name);

    //Equality
    if(opponentChoice._weight == this._weight){
      return GameResult.EQUALITY;
    }

    //other possibilities
    if(opponentChoice._weight < this._weight ||
        (this._weight == 0 && opponentChoice._weight == 2)
    ){
      debugPrint("Player wins with: " + this.name);
      return GameResult.WON;
    }
    debugPrint("CPU wins with: " + opponentChoice.name);
    return GameResult.LOST;
  }

  Choice _getRandomOpponentChoice(){
    final _random = new Random();
    return Util.gameCards[_random.nextInt(Util.gameCards.length)];
  }

  String get imagePath => _imagePath;

  String get name => _name;

}