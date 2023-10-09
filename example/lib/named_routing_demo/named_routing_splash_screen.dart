import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';

class NamedRoutingSplashScreen extends StatefulWidget {
  const NamedRoutingSplashScreen({super.key});

  @override
  State<NamedRoutingSplashScreen> createState() =>
      _NamedRoutingSplashScreenState();
}

class _NamedRoutingSplashScreenState extends State<NamedRoutingSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.gif(
      useImmersiveMode: true,
      gifPath: 'assets/example.gif',
      gifWidth: 269,
      gifHeight: 474,
      duration: const Duration(seconds: 2),
      onEnd: () async {},
      asyncNavigationCallback: () async {
        await Future.delayed(const Duration(seconds: 3));
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, "home");
        }
      },
    );
  }
}
