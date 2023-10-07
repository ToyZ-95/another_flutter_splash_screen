import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterSplashScreen extends StatefulWidget {
  const GoRouterSplashScreen({super.key});

  @override
  State<GoRouterSplashScreen> createState() => _GoRouterSplashScreenState();
}

class _GoRouterSplashScreenState extends State<GoRouterSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.gif(
      useImmersiveMode: true,
      gifPath: 'assets/example.gif',
      gifWidth: 269,
      gifHeight: 474,
      // duration: const Duration(seconds: 2),
      onEnd: () async {
        context.replace('/home');
        // GoRouter.of(context).goNamed("home");
        // context.goNamed('home');
      },
      asyncCallback: () async {
        print("object");
        await Future.delayed(const Duration(seconds: 3));
        print("object2");
      },
    );
    // return FlutterSplashScreen.fadeIn(
    //   backgroundColor: Colors.white,
    //   childWidget: SizedBox(
    //     height: 200,
    //     width: 200,
    //     child: Image.asset("assets/dart_bird.png"),
    //   ),
    //   onAnimationEnd: () => debugPrint("On Fade In End"),
    //   asyncCallback: () async {
    //     print("object1");
    //     await Future.delayed(const Duration(milliseconds: 5000));
    //     print("object2");
    //   },
    //   onEnd: () {
    //     context.replace('/home');
    //   },
    // );
  }
}
