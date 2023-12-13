import 'package:flame_playground/screens/game_play.dart';
import 'package:flame_playground/screens/main_menu.dart';
import 'package:flutter/material.dart';

class GameOptions extends StatelessWidget {
  const GameOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Text('Choose your Player',
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
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //   Container(
          //     child: InkWell(
          //   onTap: () {},
          //   child: ClipRRect(
          //       borderRadius: BorderRadius.circular(20.0),
          //       child: Image.asset('assets/images/Main Characters/Ninja Frog/Jump (32x32).png',
          //           width: 110.0, height: 110.0),
          //     ),
          // ),
          //   ),
          Image.asset(
              'assets/images/Main Characters/Ninja Frog/Jump (32x32).png',
              width: 64,
              height: 64,
              fit: BoxFit.fitHeight),
          const SizedBox(width: 10),
          Image.asset(
              'assets/images/Main Characters/Mask Dude/Jump (32x32).png',
              width: 64,
              height: 64,
              fit: BoxFit.fitHeight),
          const SizedBox(width: 10),
          Image.asset('assets/images/Main Characters/Pink Man/Jump (32x32).png',
              width: 64, height: 64, fit: BoxFit.fitHeight),
          const SizedBox(width: 10),
          Image.asset(
              'assets/images/Main Characters/Virtual Guy/Jump (32x32).png',
              width: 64,
              height: 64,
              fit: BoxFit.fitHeight),
          const SizedBox(width: 10),
        ],
      ),
      SizedBox(height: 75),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MainMenu()));
              },
              child: Text('Main Menu'),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const GamePlay()));
                },
                child: Text('Play Game'),
              )),
        ],
      )
    ])));
  }
}
