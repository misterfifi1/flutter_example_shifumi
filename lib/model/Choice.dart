import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shifumi/model/GameResult.dart';
import 'package:shifumi/util/Util.dart';

class Choice {

  final String _name;
  final String _imagePath;
  final int _identifier;
  final int _strongerThan;

  Choice(this._name, this._imagePath, this._identifier, this._strongerThan);

  GameResult isWinner(){
    debugPrint("----------------- (CPU VS PLAYER)");
    Choice opponentChoice = this._getRandomOpponentChoice();
    debugPrint(opponentChoice.name + " VS " + this.name);

    //Equality
    if(opponentChoice.identifier == this.identifier){
      debugPrint("EQUALITY");
      return GameResult.EQUALITY;
    }

    //we read the solution (index vs value = win)
    if(this._strongerThan == opponentChoice.identifier){
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

  int get identifier => _identifier;

  int get strongerThan => _strongerThan;

}