import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/painting.dart';
import 'package:flame_playground/components/player.dart';
import 'package:flame_playground/components/level.dart';

// tell our game that we have the ability to handle keyboard components
class Activity extends FlameGame
    with HasKeyboardHandlerComponents, DragCallbacks, HasCollisionDetection {
  @override
  Color backgroundColor() => const Color(0xFF211F30);
  late CameraComponent cam;
  Player player = Player(character: 'Ninja Frog');
  late JoystickComponent joystick;
  bool showJoystick = false;
  List<String> levelNames = ['Level-02', 'Level-03'];
  int currentLevelIndex = 0;

  @override
  FutureOr<void> onLoad() async {
    // don't do this if you have a lot
    // load all images into cache
    await images.loadAllImages();

    _loadLevel();

    if (showJoystick) {
      addJoystick();
    }

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (showJoystick) {
      updateJoystick();
    }
    super.update(dt);
  }

  void addJoystick() {
    joystick = JoystickComponent(
        knob: SpriteComponent(
          sprite: Sprite(
            images.fromCache('HUD/Knob.png'),
          ),
        ),
        background: SpriteComponent(
          sprite: Sprite(
            images.fromCache('HUD/Joystick.png'),
          ),
        ),
        margin: const EdgeInsets.only(left: 32, bottom: 32),
        priority: 1);

    add(joystick);
  }

  void updateJoystick() {
    switch (joystick.direction) {
      case JoystickDirection.left:
      case JoystickDirection.upLeft:
      case JoystickDirection.downLeft:
        player.horizontalMovement = -1;
      case JoystickDirection.right:
      case JoystickDirection.upRight:
      case JoystickDirection.downRight:
        player.horizontalMovement = 1;
      default:
        player.horizontalMovement = 0;
        break;
    }
  }

  void loadNextLevel() {
    if (currentLevelIndex < levelNames.length - 1) {
      currentLevelIndex++;
      _loadLevel();
    } else {
      // no more levels
    }
  }

  void _loadLevel() {
    Future.delayed(const Duration(seconds: 1), () {
      Level world =
          Level(player: player, levelName: levelNames[currentLevelIndex]);

      cam = CameraComponent.withFixedResolution(
          world: world, width: 640, height: 360);
      // change camera anchor
      cam.viewfinder.anchor = Anchor.topLeft;

      addAll([cam, world]);
    });
  }
}
