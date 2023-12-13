import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_playground/activity.dart';

class Option extends SpriteAnimationComponent with HasGameRef<Activity> {
  late String option;
  Option({this.option = 'Spoon', position, size})
      : super(position: position, size: size);

  @override
  Future<void> onLoad() async {
    // debugMode = true;
    priority = 2;

    await super.onLoad();
    option = 'test opt';
    // positionType = PositionType.viewport;
    // text = 'Q: $option';
    position = Vector2(2.5, 2.5);

    final style = TextStyle(
      color: BasicPalette.darkBlue.color,
      fontSize: 20.0, // Change the font size here
    );
    final regular = TextPaint(style: style);
    // final halfwayPoint = (game.size.x / 4).floor().toDouble();

    TextComponent startText = TextComponent(
      text: 'test quest',
      textRenderer: regular,
    )
      ..anchor = Anchor.topCenter
      ..x = (width * 0.2)
      ..y = (height - (height * 0.5))
      ..priority = 300;

    return super.onLoad();
  }
}
