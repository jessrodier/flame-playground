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

  final questText = TextPaint(
      style: TextStyle(color: BasicPalette.black.color, fontSize: 18));

  @override
  Future<void> onLoad() async {
    // debugMode = true;
    priority = 2;

    await super.onLoad();
    option = 'test opt';
    PositionType positionType = PositionType.viewport;
    String text = 'Q: $option';
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

    final halfwayPoint = (game.size.x / 4).floor().toDouble();

    add(TextComponent(text: 'apple', textRenderer: questText)
      ..anchor = Anchor.center
      // ..x = halfwayPoint
      // ..y = 96.0
      ..priority = 2);

    // return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    option = 'test opt';
    String text = 'Q: $option';
  }
}
