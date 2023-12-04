import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_playground/activity.dart';
import 'package:flame_playground/components/player.dart';

class Checkpoint extends SpriteAnimationComponent
    with HasGameRef<Activity>, CollisionCallbacks {
  Checkpoint({position, size}) : super(position: position, size: size);

  bool hasReachedCheckpoint = false;

  @override
  FutureOr<void> onLoad() {
    // debugMode = true;
    add(RectangleHitbox(
      position: Vector2(18, 56),
      size: Vector2(12, 8),
      collisionType: CollisionType.passive,
    ));
    animation = SpriteAnimation.fromFrameData(
        game.images
            .fromCache('Items/Checkpoints/Checkpoint/Checkpoint (No Flag).png'),
        SpriteAnimationData.sequenced(
            amount: 1, stepTime: 1, textureSize: Vector2.all(64)));
    return super.onLoad();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player && !hasReachedCheckpoint) _reachedCheckpoint();
    super.onCollision(intersectionPoints, other);
  }

  void _reachedCheckpoint() {
    hasReachedCheckpoint = true;
    animation = SpriteAnimation.fromFrameData(
        game.images.fromCache(
            'Items/Checkpoints/Checkpoint/Checkpoint (Flag Out) (64x64).png'),
        SpriteAnimationData.sequenced(
            amount: 26,
            stepTime: 0.05,
            textureSize: Vector2.all(64),
            loop: false));
    const flagDuration = Duration(milliseconds: 50 * 26);
    Future.delayed(flagDuration, () {
      animation = SpriteAnimation.fromFrameData(
          game.images.fromCache(
              'Items/Checkpoints/Checkpoint/Checkpoint (Flag Idle) (64x64).png'),
          SpriteAnimationData.sequenced(
              amount: 10, stepTime: 0.05, textureSize: Vector2.all(64)));
    });
  }
}
