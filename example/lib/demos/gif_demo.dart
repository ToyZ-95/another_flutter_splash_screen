import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';

class GifDemo extends StatefulWidget {
  const GifDemo({super.key});

  @override
  State<GifDemo> createState() => _GifDemoState();
}

class _GifDemoState extends State<GifDemo> {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      duration: const Duration(milliseconds: 3515),
      onInit: () async {
        debugPrint("onInit 1");
        await Future.delayed(const Duration(milliseconds: 2000));
        debugPrint("onInit 2");
      },
      onEnd: () async {
        debugPrint("onEnd 1");
        debugPrint("onEnd 2");
      },
      splashScreenBody: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SizedBox(
            width: 269,
            height: 474,
            child: Image.asset('assets/example.gif'),
          ),
        ),
      ),
      nextScreen: const MyHomePage(),
    );
  }
}
