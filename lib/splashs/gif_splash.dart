import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GifSplash extends StatefulWidget {
  GifSplash({super.key});

  /// Background color of flutter splash screen scaffold.

  /// ```dart
  /// backgroundColor: const Color(0xff080A12),
  /// ```
  Color? backgroundColor;

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

  //#region Opacity

  @override
  State<GifSplash> createState() => _GifSplashState();
}

class _GifSplashState extends State<GifSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Center(
        child: SizedBox(
          width: widget.gifWidth,
          height: widget.gifHeight,
          child: Image.asset(widget.gifPath!),
        ),
      ),
    );
  }
}
