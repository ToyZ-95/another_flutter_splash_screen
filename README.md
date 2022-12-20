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

[![pub package](https://img.shields.io/pub/v/another_flutter_splash_screen?logo=flutter&style=for-the-badge)](https://pub.dev/packages/another_flutter_splash_screen)

# Splash screens made simple

<p float="left">
<img src="https://github.com/ToyZ-95/another_flutter_splash_screen/blob/main/example/assets/gif_demo.gif" width="250" height="500"/>

<img src="https://github.com/ToyZ-95/another_flutter_splash_screen/blob/main/example/assets/opacity_demo.gif" width="250" height="500"/>
</p>


## Getting started

Add another_flutter_splash_screen to your pubspec.yaml file and start implementing splash screen easily.

## Installation

You just need to add `another_flutter_splash_screen` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).

```yaml
dependencies:
  another_flutter_splash_screen: <Latest Version>
```

## Usage

You just need to import `another_flutter_splash_screen`.

```dart
    import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
```

### A splash screen with a gif splash.

```dart
FlutterSplashScreen.gif(
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
```

### A splash screen with fade in splash.

```dart
FlutterSplashScreen.fadeIn(
          backgroundColor: Colors.white,
          onInit: () {
            debugPrint("On Init");
          },
          onEnd: () {
            debugPrint("On End");
          },
          animationCurve: Curves.easeIn,
          fadeInChildWidget: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("assets/dart_bird.png"),
          ),
          onFadeInEnd: () => debugPrint("On Fade In End"),
          nextScreen: const MyHomePage(),
        );
```

### Demonstration of setNextScreenAsyncCallback to dynamically decide which screen to show after the splash screen.
```dart
FlutterSplashScreen(
...
setNextScreenAsyncCallback: () async {
      String? token = await CredentialStore.getBrearerToken();
      if (token != null && token.isNotEmpty) {
        CustomNavigator.instance.replace(nextScreen: const Dashboard());
      } else {
        CustomNavigator.instance.replace(nextScreen: SSOScreen());
      }
    },
...
)
```

### A splash screen with custom splash.
```dart
FlutterSplashScreen(
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
        )
```

## Additional information

We will be more than happy for your contributions.
<br />
Please contribute to [another_flutter_splash_screen](https://github.com/ToyZ-95/another_flutter_splash_screen) this github repo.
