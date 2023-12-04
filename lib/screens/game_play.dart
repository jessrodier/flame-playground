// import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_playground/activity.dart';
import 'package:flutter/material.dart';

Activity _activity = Activity();

class GamePlay extends StatelessWidget {
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: GameWidget(game: _activity), onWillPop: () async => false);
  }
}
