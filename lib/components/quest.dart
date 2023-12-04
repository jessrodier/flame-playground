import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_playground/activity.dart';

class Quest extends TextComponent with HasGameRef<Activity> {
  Quest({position, size}) : super(position: position, size: size);

  @override
  FutureOr<void> onLoad() {
    // debugMode = true;
    // animation = SpriteAnimation.fromFrameData(
    //     game.images
    //         .fromCache('Items/Checkpoints/Checkpoint/Checkpoint (No Flag).png'),
    //     SpriteAnimationData.sequenced(
    //         amount: 1, stepTime: 1, textureSize: Vector2.all(64)));
    return super.onLoad();
  }
}
