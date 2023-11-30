import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flame_playground/activity.dart';

void main() async {
  // Sets full screen and landscape on devices
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  Activity game = Activity();
  // kDebugMode prevents from needing to refresh app on save
  runApp(GameWidget(game: kDebugMode ? Activity() : game));
}
