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

  /// Sets full screen background image.
  ///
  /// Supports both Image.assets() and Image.network()
  ///
  /// ```dart
  /// backgroundImage : Image.asset("assets/splash_bg.png");
  /// ```
  /// ```dart
  /// backgroundImage : Image.network("https://www.schemecolor.com/wallpaper?i=4334&og");
  /// ```
  Image? backgroundImage;

  /// Sets full screen gradient.
  ///
  /// ```dart
  /// gradient: const LinearGradient(
  ///          begin: Alignment.topCenter,
  ///          end: Alignment.bottomCenter,
  ///          colors: [
  ///            Colors.orange,
  ///            Colors.deepOrange,
  ///          ],
  ///        ),
  /// ```
  Gradient? gradient;

  @override
  State<GifSplash> createState() => _GifSplashState();
}

class _GifSplashState extends State<GifSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          image: widget.backgroundImage != null
              ? DecorationImage(image: widget.backgroundImage!.image)
              : null,
          gradient: widget.gradient,
        ),
        child: Center(
          child: SizedBox(
            width: widget.gifWidth,
            height: widget.gifHeight,
            child: Image.asset(widget.gifPath!),
          ),
        ),
      ),
    );
  }
}
