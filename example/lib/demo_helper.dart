import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';

enum DemoType {
  custom,
  gif,
  fadeIn,
  dynamicNextScreenFadeIn,
  usingBackgroundImage,
  usingGradient,
}

// ignore: must_be_immutable
class DemoHelper extends StatefulWidget {
  DemoHelper({super.key, required this.demoType});

  DemoType demoType;

  @override
  State<DemoHelper> createState() => _DemoHelperState();
}

class _DemoHelperState extends State<DemoHelper> {
  @override
  Widget build(BuildContext context) {
    switch (widget.demoType) {
      case DemoType.gif:
        return FlutterSplashScreen.gif(
          gifPath: 'assets/example.gif',
          gifWidth: 269,
          gifHeight: 474,
          defaultNextScreen: const MyHomePage(),
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
        );
      case DemoType.fadeIn:
        return FlutterSplashScreen.fadeIn(
          backgroundColor: Colors.white,
          onInit: () {
            debugPrint("On Init");
          },
          onEnd: () {
            debugPrint("On End");
          },
          fadeInChildWidget: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("assets/dart_bird.png"),
          ),
          onFadeInEnd: () => debugPrint("On Fade In End"),
          defaultNextScreen: const MyHomePage(),
        );
      case DemoType.usingBackgroundImage:
        return FlutterSplashScreen.fadeIn(
          backgroundImage: Image.asset("assets/splash_bg.png"),
          fadeInChildWidget: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/twitter_logo_white.png"),
          ),
          defaultNextScreen: const MyHomePage(),
        );
      case DemoType.usingGradient:
        return FlutterSplashScreen.fadeIn(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffFF6972), Color(0xffFE6770)],
          ),
          fadeInChildWidget: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/tiktok.gif"),
          ),
          defaultNextScreen: const MyHomePage(),
        );
      case DemoType.dynamicNextScreenFadeIn:
        return FlutterSplashScreen.fadeIn(
          backgroundColor: Colors.white,
          fadeInChildWidget: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("assets/dart_bird.png"),
          ),
          onFadeInEnd: () => debugPrint("On Fade In End"),
          defaultNextScreen: const MyHomePage(),
          setNextScreenAsyncCallback: () async {
            await Future.delayed(const Duration(milliseconds: 1500));
            return const MyHomePage2();
          },
        );
      case DemoType.custom:
        return FlutterSplashScreen(
          duration: const Duration(milliseconds: 2000),
          defaultNextScreen: const MyHomePage(),
          backgroundColor: Colors.white,
          splashScreenBody: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Text(
                  "Custom Splash",
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
                const Spacer(),
                SizedBox(
                  width: 200,
                  child: Image.asset('assets/flutter.png'),
                ),
                const Spacer(),
                const Text(
                  "Flutter is Love",
                  style: TextStyle(color: Colors.pink, fontSize: 20),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        );
      default:
        return Container();
    }
  }
}
