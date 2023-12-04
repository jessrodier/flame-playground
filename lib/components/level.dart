import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_playground/components/checkpoint.dart';
// import 'package:flame_playground/components/quest.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flame_playground/activity.dart';
import 'package:flame_playground/components/background_tile.dart';
import 'package:flame_playground/components/collision_block.dart';
import 'package:flame_playground/components/fruit.dart';
import 'package:flame_playground/components/player.dart';
import 'package:flame_playground/components/saw.dart';

class Level extends World with HasGameRef<Activity> {
  final String levelName;
  final Player player;
  Level({required this.levelName, required this.player});
  late TiledComponent level;
  List<CollisionBlock> collisionBlocks = [];

  @override
  FutureOr<void> onLoad() async {
    level = await TiledComponent.load('$levelName.tmx', Vector2.all(16));

    add(level);

    _scrollingBackground();
    // _levelQuestion(); // TODO: Add quests!
    _spawningObjects();
    _addCollisions();

    return super.onLoad();
  }

  void _scrollingBackground() {
    final backgroundLayer = level.tileMap.getLayer('Background');
    const tileSize = 64;

    final numTilesY = (game.size.y / tileSize).floor();
    final numTilesX = (game.size.x / tileSize).floor();

    if (backgroundLayer != null) {
      final backgroundColor =
          backgroundLayer.properties.getValue('BackgroundColor');

      for (double y = 0; y < game.size.y / numTilesY; y++) {
        for (double x = 0; x < numTilesX; x++) {
          final backgroundTile = BackgroundTile(
              color: backgroundColor ?? 'Gray',
              position: Vector2(x * tileSize, y * tileSize - tileSize));

          add(backgroundTile);
        }
      }
    }
  }

  void _spawningObjects() {
    final spawnPointsLayer = level.tileMap.getLayer<ObjectGroup>('Spawnpoints');

    if (spawnPointsLayer != null) {
      for (final spawnPoint in spawnPointsLayer.objects) {
        switch (spawnPoint.class_) {
          case 'Player':
            player.position = Vector2(spawnPoint.x, spawnPoint.y);
            add(player);
          case 'Fruit':
            final fruit = Fruit(
                fruit: spawnPoint.name,
                position: Vector2(spawnPoint.x, spawnPoint.y),
                size: Vector2(spawnPoint.width, spawnPoint.height));
            add(fruit);
          case 'Saw':
            final isVertical = spawnPoint.properties.getValue('isVertical');
            final offsetNeg = spawnPoint.properties.getValue('offsetNeg');
            final offsetPos = spawnPoint.properties.getValue('offsetPos');
            final saw = Saw(
                isVertical: isVertical,
                offsetNeg: offsetNeg,
                offsetPos: offsetPos,
                position: Vector2(spawnPoint.x, spawnPoint.y),
                size: Vector2(spawnPoint.width, spawnPoint.height));
            add(saw);
          case 'Checkpoint':
            final checkpoint = Checkpoint(
                position: Vector2(spawnPoint.x, spawnPoint.y),
                size: Vector2(spawnPoint.width, spawnPoint.height));
            add(checkpoint);
          default:
        }
      }
    }
  }

  void _addCollisions() {
    final collisionsLayer = level.tileMap.getLayer<ObjectGroup>('Collisions');

    if (collisionsLayer != null) {
      for (final collision in collisionsLayer.objects) {
        switch (collision.class_) {
          case 'Platform':
            final platform = CollisionBlock(
              position: Vector2(collision.x, collision.y),
              size: Vector2(collision.width, collision.height),
              isPlatform: true,
            );
            collisionBlocks.add(platform);
            add(platform);
            break;
          default:
            final block = CollisionBlock(
              position: Vector2(collision.x, collision.y),
              size: Vector2(collision.width, collision.height),
            );
            collisionBlocks.add(block);
            add(block);
        }
      }
    }
    player.collisionBlocks = collisionBlocks;
  }

  // void _levelQuestion() {
  //   final dataLayer = level.tileMap.getLayer<ObjectGroup>('Data');

  //   if (dataLayer != null) {
  //     for (final data in dataLayer.objects) {
  //       switch (data.class_) {
  //         case 'Quest':
  //           final quest = Quest(
  //                 position: Vector2(spawnPoint.x, spawnPoint.y),
  //                 size: Vector2(spawnPoint.width, spawnPoint.height));
  //           add(quest);
  //         default:
  //       }
  //     }
  //   }
  // }
}
