<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

[![pub package](https://img.shields.io/pub/v/another_flutter_splash_screen?style=for-the-badge)](https://pub.dev/packages/another_flutter_splash_screen)

# Splash screens made simple

## Features

![](https://github.com/ToyZ-95/another_flutter_splash_screen/blob/main/example/assets/gif_demo.gif)

## Getting started

Add another_flutter_splash_screen to your pubspec.yaml file and start implementing splash screen easily.

## Installation

You just need to add `another_flutter_splash_screen` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).

```yaml
dependencies:
  another_flutter_splash_screen: ^1.0.0
```

## Usage

You just need to import `another_flutter_splash_screen`.

```dart
    import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
```

### A splash screen with gif.

```dart
FlutterSplashScreen(
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
```

### A splash screen with fade in animation.

```dart
FlutterSplashScreen(
      setStateCallback: () {
        setState(
          () {
            opacity = 1;
          },
        );
      },
      backgroundColor: Colors.white,
      splashScreenBody: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: AnimatedOpacity(
            opacity: opacity,
            onEnd: () {
              debugPrint("Animation End");
            },
            duration: const Duration(milliseconds: 2000),
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset("assets/dart_bird.png"),
            ),
          ),
        ),
      ),
      nextScreen: const MyHomePage(),
    );
```

## Additional information

We will be more than happy for your contributions.
<br />
Please contribute to [another_flutter_splash_screen](https://github.com/ToyZ-95/another_flutter_splash_screen) this github repo.
