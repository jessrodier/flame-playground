import 'package:flame_playground/screens/game_options.dart';
import 'package:flame_playground/screens/game_play.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Text('Funactivities',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 50.0, shadows: [
                Shadow(
                  blurRadius: 20.0,
                  color: Colors.white,
                  offset: Offset(0, 0),
                )
              ])),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const GamePlay()));
            },
            child: Text('Play'),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const GameOptions()));
              },
              child: Text('Options'),
            )),
      ]),
    ));
  }
}
