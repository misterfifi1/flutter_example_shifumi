import 'dart:math';

import 'package:shifumi/util/Util.dart';

class Choice {

  final String _name;
  final String _imagePath;
  final int _weight;

  Choice(this._name, this._imagePath, this._weight);

  bool isWinner(){
    Choice opponentChoice = this._getRandomOpponentChoice();
    if(opponentChoice._weight < this._weight ||
        (this._weight == 0 && opponentChoice._weight == 2)
    ){
      return true;
    }
    return false;
  }

  Choice _getRandomOpponentChoice(){
    final _random = new Random();
    return Util.gameCards[_random.nextInt(Util.gameCards.length)];
  }

  String get imagePath => _imagePath;

  String get name => _name;

}