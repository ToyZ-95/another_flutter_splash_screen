// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FadeInSplash extends StatefulWidget {
  FadeInSplash({super.key});

  /// Background color of flutter splash screen scaffold.

  /// ```dart
  /// backgroundColor: const Color(0xff080A12),
  /// ```
  Color? backgroundColor;

  //#region FadeIn

  double opacity = 0;

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

  /// Takes curve of animation.
  /// ```dart
  /// Curve animationCurve = Curves.ease;
  /// ```
  Curve? animationCurve = Curves.ease;

  //#endregion

  @override
  State<FadeInSplash> createState() => _FadeInSplashState();
}

class _FadeInSplashState extends State<FadeInSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Center(
        child: AnimatedOpacity(
          opacity: widget.opacity,
          curve: widget.animationCurve!,
          onEnd: widget.onFadeInEnd,
          duration: widget.fadeInAnimationDuration!,
          child: widget.fadeInChildWidget,
        ),
      ),
    );
  }
}
