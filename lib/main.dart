import 'package:flame/flame.dart';
import 'package:flame_playground/screens/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  // Sets full screen and landscape on devices
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  // Activity game = Activity();
  // kDebugMode prevents from needing to refresh app on save
  runApp(MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.bungeeInlineTextTheme(),
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MainMenu()));
}
