library another_flutter_splash_screen;

import 'package:another_flutter_splash_screen/enums/splash_type_enum.dart';
import 'package:another_flutter_splash_screen/splashs/fade_In_splash.dart';
import 'package:another_flutter_splash_screen/splashs/gif_splash.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FlutterSplashScreen extends StatefulWidget {
  FlutterSplashScreen({
    Key? key,
    this.duration = const Duration(milliseconds: 3000),
    this.backgroundColor = Colors.black,
    this.splashScreenBody,
    required this.nextScreen,
    this.setStateTimer = const Duration(milliseconds: 100),
    this.setStateCallback,
    this.onInit,
    this.onEnd,
  }) : super(key: key);

  /// [Duration] for how long flutter splash screen should stay.
  /// ```dart
  /// duration: const Duration(milliseconds: 2000),
  /// ```
  Duration duration;

  /// Background color of flutter splash screen scaffold.

  /// ```dart
  /// backgroundColor: const Color(0xff080A12),
  /// ```
  Color? backgroundColor;

  /// [Widget] wrapped inside a [Scaffold] which will be shown at flutter splash screen duration.

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
  Widget? splashScreenBody;

  /// [Widget] to which app should navigate to after flutter splash screen.

  /// ```dart
  ///  nextScreen: const MyHomePage(),
  /// ```
  Widget? nextScreen;

  /// [Duration] to set the state of [splashScreenBody].

  /// ```dart
  /// setStateTimer: const Duration(milliseconds: 100),
  /// ```
  Duration setStateTimer;

  /// A [VoidCallback] which will be triggered on when [splashScreenBody]'s state is set.

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

  //#region Gif
  /// File path of gif.
  /// ```dart
  /// ```
  String? gifPath;

  /// Width of gif.
  /// ```dart
  /// ```
  double? gifWidth;

  /// Height of gif.
  /// ```dart
  /// ```
  double? gifHeight;
  //#endregion

  //#region FadeIn

  double _opacity = 0;

  /// A [VoidCallback] which will be triggered after flutter splash screen [Duration].
  /// ```dart
  /// onInit: ()  {
  ///   debugPrint("Opacity Animation End");
  /// }
  /// ```
  VoidCallback? onFadeInEnd;

  /// A child [Widget] which will be shown during opacity animation.
  /// ```dart
  /// opacityChildWidget : SizedBox(
  ///          height: 200,
  ///          width: 200,
  ///          child: Image.asset("assets/dart_bird.png"),
  ///       )
  /// ```
  Widget? fadeInChildWidget;

  /// [Duration] to complate opacity animation.
  /// ```dart
  /// duration: const Duration(milliseconds: 2000),
  /// ```
  Duration? fadeInAnimationDuration;

  //#endregion

  SplashType splashType = SplashType.custom;

  @override
  State<FlutterSplashScreen> createState() => _FlutterSplashScreenState();

  FlutterSplashScreen.gif({
    super.key,
    required this.gifPath,
    required this.gifWidth,
    required this.gifHeight,
    required this.nextScreen,
    this.duration = const Duration(milliseconds: 3000),
    this.backgroundColor = Colors.black,
    this.setStateTimer = const Duration(milliseconds: 100),
    this.setStateCallback,
    this.onInit,
    this.onEnd,
  }) {
    splashType = SplashType.gif;
  }

  FlutterSplashScreen.fadeIn({
    super.key,
    required this.nextScreen,
    required this.fadeInChildWidget,
    this.fadeInAnimationDuration = const Duration(milliseconds: 1500),
    this.duration = const Duration(milliseconds: 3000),
    this.backgroundColor = Colors.black,
    this.setStateTimer = const Duration(milliseconds: 500),
    this.onFadeInEnd,
    this.onInit,
    this.onEnd,
  }) {
    splashType = SplashType.fadeIn;

    setStateCallback = () {
      _opacity = 1;
    };
  }
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
        setState(() {});
      }
    });

    Future.delayed(widget.duration, () {
      widget.onEnd?.call();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return widget.nextScreen ?? Container();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.splashType == SplashType.gif) {
      return GifSplash()
        ..backgroundColor = widget.backgroundColor
        ..gifPath = widget.gifPath
        ..gifHeight = widget.gifHeight
        ..gifWidth = widget.gifWidth;
    } else if (widget.splashType == SplashType.fadeIn) {
      return FadeInSplash()
        ..opacity = widget._opacity
        ..backgroundColor = widget.backgroundColor
        ..onFadeInEnd = widget.onFadeInEnd
        ..fadeInChildWidget = widget.fadeInChildWidget
        ..fadeInAnimationDuration = widget.fadeInAnimationDuration;
    } else {
      return Scaffold(
        backgroundColor: widget.backgroundColor,
        body: widget.splashScreenBody,
      );
    }
  }
}
