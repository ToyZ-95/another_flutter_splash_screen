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

#  :star: Splash screens made simple :star:

 </br>
 
 > ### Also supports deciding next screen dynamically. [Example here](#dynamic_next_screen)
 > 
 </br>
 
## Getting started

Add another_flutter_splash_screen to your pubspec.yaml file and start implementing splash screen easily.

## Installation

Just add `another_flutter_splash_screen` as a [dependency in your pubspec.yaml file](https://flutter.io/using-packages/).

```yaml
dependencies:
  another_flutter_splash_screen: <Latest Version>
```
 </br>
 
## Usage

```dart
 import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
```

 </br>
 
## A splash screen with a gif splash.

<img src="https://github.com/ToyZ-95/another_flutter_splash_screen/raw/main/example/assets/gif_demo.gif" width="250" height="500"/>

```dart
FlutterSplashScreen.gif(
          gifPath: 'assets/example.gif',
          gifWidth: 269,
          gifHeight: 474,
          defaultNextScreen: const MyHomePage(),
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
 </br>

## A splash screen with fade in splash.
<img src="https://github.com/ToyZ-95/another_flutter_splash_screen/raw/main/example/assets/opacity_demo.gif" width="250" height="500"/>

```dart
FlutterSplashScreen.fadeIn(
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
          defaultNextScreen: const MyHomePage(),
        );
```
 </br>
 
 ## A splash screen with scale splash.
<img src="https://github.com/ToyZ-95/another_flutter_splash_screen/raw/main/example/assets/scale_demo.gif" width="250" height="500"/>

```dart
FlutterSplashScreen.scale(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightBlue,
              Colors.blue,
            ],
          ),
          childWidget: SizedBox(
            height: 50,
            child: Image.asset("assets/twitter_logo_white.png"),
          ),
          duration: const Duration(milliseconds: 1500),
          animationDuration: const Duration(milliseconds: 1000),
          onAnimationEnd: () => debugPrint("On Scale End"),
          defaultNextScreen: const MyHomePage(),
        );
```
 </br>

## A splash screen using background image.

<img src="https://github.com/ToyZ-95/another_flutter_splash_screen/raw/main/example/assets/background_image_demo.gif" width="250" height="500"/>

```dart
FlutterSplashScreen.fadeIn(
          backgroundImage: Image.asset("assets/splash_bg.png"),
          childWidget: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/twitter_logo_white.png"),
          ),
          defaultNextScreen: const MyHomePage(),
        );
```

 </br>
<a name="dynamic_next_screen">

## Demonstration of setNextScreenAsyncCallback to dynamically decide which screen to show after the splash screen.

<img src="https://github.com/ToyZ-95/another_flutter_splash_screen/raw/main/example/assets/dynamic_next_screen_demo.gif" width="250" height="500"/>

```dart
FlutterSplashScreen(
...
setNextScreenAsyncCallback: () async {
        String? token = await CredentialStore.getBrearerToken();

        if (token != null && token.isNotEmpty) {
          return const Dashboard();
        } else {
          return SSOScreen();
        }
      },
...
);
```

</a>
 </br>

## A splash screen using gradient.

<img src="https://github.com/ToyZ-95/another_flutter_splash_screen/raw/main/example/assets/gradient_demo.gif" width="250" height="500"/>

```dart
FlutterSplashScreen.fadeIn(
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
          defaultNextScreen: const MyHomePage(),
        );
```
 </br>
 
## A splash screen with custom splash.

```dart
FlutterSplashScreen(
          duration: const Duration(milliseconds: 2000),
          defaultNextScreen: const MyHomePage(),
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
```

## Additional information

We will be more than happy for your contributions.
<br />
Please contribute to [another_flutter_splash_screen](https://github.com/ToyZ-95/another_flutter_splash_screen) this github repo.
