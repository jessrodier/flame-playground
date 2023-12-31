import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_playground/activity.dart';

class Quest extends TextComponent
    with HasGameRef<Activity>, CollisionCallbacks {
  Quest({position, size}) : super(position: position, size: size);

  final questText = TextPaint(
      style: TextStyle(color: BasicPalette.black.color, fontSize: 18));

  @override
  Future<void> onLoad() async {
    final style = TextStyle(
      color: BasicPalette.darkBlue.color,
      fontSize: 20.0, // Change the font size here
    );
    final regular = TextPaint(style: style);
    final halfwayPoint = (game.size.x / 4).floor().toDouble();

    TextComponent startText = TextComponent(
      text: 'test text',
      textRenderer: regular,
    )
      ..anchor = Anchor.topCenter
      ..x = (width * 0.2)
      ..y = (height - (height * 0.5))
      ..priority = 300;

    return super.onLoad();
  }
}
