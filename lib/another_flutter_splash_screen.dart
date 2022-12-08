library another_flutter_splash_screen;

import 'package:flutter/material.dart';

class FlutterSplashScreen extends StatefulWidget {
  FlutterSplashScreen({
    Key? key,
    this.duration = const Duration(milliseconds: 3000),
    this.backgroundColor = Colors.black,
    required this.splashScreenBody,
    required this.nextScreen,
    this.setStateTimer = const Duration(milliseconds: 100),
    this.setStateCallback,
    this.onInit,
    this.onEnd,
  }) : super(key: key);

  /// [Duration] for how long flutter splash screen should stay.
  /// Example
  /// ```dart
  /// duration: const Duration(milliseconds: 2000),
  /// ```
  Duration duration;

  /// Background color of flutter splash screen scaffold.
  /// Example
  /// ```dart
  /// backgroundColor: const Color(0xff080A12),
  /// ```
  Color? backgroundColor;

  /// [Widget] wrapped inside a [Scaffold] which will be shown at flutter splash screen duration.
  /// Example
  /// ```dart
  /// splashScreenBody: SizedBox(
  ///      width: MediaQuery.of(context).size.width,
  ///      height: MediaQuery.of(context).size.height,
  ///      child: Center(
  ///        child: SizedBox(
  ///          width: 269,
  ///          height: 474,
  ///         child: Image.asset('assets/example_2.gif'),
  ///        ),
  ///      ),
  ///    );
  /// ```
  Widget splashScreenBody;

  /// [Widget] to which app should navigate to after flutter splash screen.
  /// Example
  /// ```dart
  ///  nextScreen: const MyHomePage(),
  /// ```
  Widget nextScreen;

  /// [Duration] to set the state of [splashScreenBody].
  /// Example
  /// ```dart
  /// setStateTimer: const Duration(milliseconds: 100),
  /// ```
  Duration setStateTimer;

  /// A [VoidCallback] which will be triggered on when [splashScreenBody]'s state is set.
  /// Example
  /// ```dart
  ///setStateCallback: () {
  ///      setState(() {
  ///        opacity = 1;
  ///      },
  /// );
  ///    },
  /// ```
  VoidCallback? setStateCallback;

  /// A [VoidCallback] which will be triggered on flutter splash screen initialization.
  /// Example
  /// ```dart
  /// onInit: () async {
  ///   String? token =  await SharedPreferences.getInstance().getString("access_token");
  ///   if (token != null && token.isNotEmpty) {
  ///       isUserAlreadyLoggedIn = true;
  ///   }
  ///   else {
  ///       isUserAlreadyLoggedIn = true;
  ///   }
  /// }
  /// ```
  VoidCallback? onInit;

  /// A [VoidCallback] which will be triggered after flutter splash screen [Duration].
  /// Example
  /// ```dart
  /// onInit: () async {
  ///   if (isUserAlreadyLoggedIn) {
  ///       CustomNavigator.instance.replace(nextScreen: const Dashboard());
  ///   }
  ///   else {
  ///       CustomNavigator.instance.replace(nextScreen: LoginScreen());
  ///   }
  /// }
  /// ```
  VoidCallback? onEnd;

  @override
  State<FlutterSplashScreen> createState() => _FlutterSplashScreenState();
}

class _FlutterSplashScreenState extends State<FlutterSplashScreen> {
  @override
  void initState() {
    super.initState();

    widget.onInit?.call();

    Future.delayed(widget.setStateTimer, () {
      debugPrint("Set State");
      if (mounted) {
        widget.setStateCallback?.call();
      }
    });

    Future.delayed(widget.duration, () {
      widget.onEnd?.call();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return widget.nextScreen;
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: widget.splashScreenBody,
    );
  }
}
