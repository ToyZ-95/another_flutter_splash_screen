import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';

class Opacitydemo extends StatefulWidget {
  const Opacitydemo({super.key});

  @override
  State<Opacitydemo> createState() => _OpacitydemoState();
}

class _OpacitydemoState extends State<Opacitydemo> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      setStateCallback: () {
        setState(
          () {
            opacity = 1;
          },
        );
      },
      backgroundColor: Colors.white,
      splashScreenBody: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: AnimatedOpacity(
            opacity: opacity,
            onEnd: () {
              debugPrint("Animation End");
            },
            duration: const Duration(milliseconds: 2000),
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset("assets/dart_bird.png"),
            ),
          ),
        ),
      ),
      nextScreen: const MyHomePage(),
    );
  }
}
