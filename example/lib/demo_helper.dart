import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum DemoType {
  custom,
  gif,
  fadeIn,
  scale,
  dynamicNextScreenFadeIn,
  usingBackgroundImage,
  usingGradient,
  lottieAnimation,
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
          useImmersiveMode: true,
          gifPath: 'assets/example.gif',
          gifWidth: 269,
          gifHeight: 474,
          nextScreen: const MyHomePage(),
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
          childWidget: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("assets/dart_bird.png"),
          ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen: const MyHomePage(),
        );
      case DemoType.scale:
        return FlutterSplashScreen.scale(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightBlue,
              Colors.blue,
            ],
          ),
          onInit: () {
            debugPrint("On Init");
          },
          onEnd: () {
            debugPrint("On End");
          },
          childWidget: SizedBox(
            height: 50,
            child: Image.asset("assets/twitter_logo_white.png"),
          ),
          duration: const Duration(milliseconds: 1500),
          animationDuration: const Duration(milliseconds: 1000),
          onAnimationEnd: () => debugPrint("On Scale End"),
          nextScreen: const MyHomePage(),
        );
      case DemoType.usingBackgroundImage:
        return FlutterSplashScreen.fadeIn(
          backgroundImage: Image.asset("assets/splash_bg.png"),
          childWidget: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/twitter_logo_white.png"),
          ),
          nextScreen: const MyHomePage(),
        );
      case DemoType.usingGradient:
        return FlutterSplashScreen.fadeIn(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffFF6972), Color(0xffFE6770)],
          ),
          childWidget: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/tiktok.gif"),
          ),
          nextScreen: const MyHomePage(),
        );
      case DemoType.dynamicNextScreenFadeIn:
        return FlutterSplashScreen.fadeIn(
          backgroundColor: Colors.white,
          childWidget: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("assets/dart_bird.png"),
          ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen: const MyHomePage2(),
          asyncNavigationCallback: () async {
            print("object1");
            await Future.delayed(const Duration(milliseconds: 5000));
            print("object2");
          },
        );
      case DemoType.custom:
        return FlutterSplashScreen(
          duration: const Duration(milliseconds: 2000),
          nextScreen: const MyHomePage(),
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
      case DemoType.lottieAnimation:
        return FlutterSplashScreen(
          useImmersiveMode: true,
          duration: const Duration(milliseconds: 2000),
          nextScreen: const MyHomePage(),
          backgroundColor: Colors.white,
          splashScreenBody: Center(
            child: Lottie.asset(
              "assets/lottie_loading_2.json",
              repeat: false,
            ),
          ),
        );
      default:
        return Container();
    }
  }
}
