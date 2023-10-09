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
 
 
 > ### Supports deciding next screen dynamically. [Example here](#dynamic_routing)
 >
 > ### Supports Immersive Mode (Hide Status Bar in Splash Screen). [Example here](#immersive_mode)
 > 
 </br>

 <a href="https://www.buymeacoffee.com/patelasad4u" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 40px !important;width: 150px !important;" ></a>
 
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
          nextScreen: const MyHomePage(),
          duration: const Duration(milliseconds: 3515),
          onInit: () async {
            debugPrint("onInit");
          },
          onEnd: () async {
            debugPrint("onEnd 1");
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
          nextScreen: const MyHomePage(),
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
          nextScreen: const MyHomePage(),
        );
```
 </br>

<a name="dynamic_routing">
 
 ## Dynamic routing
 - ### Following is the example of Navigate using different mechanisms
 
 ```dart
 FlutterSplashScreen.gif(
      ...
      // go_router example
      asyncNavigationCallback: () async {
        var response = await userRepository.getUserData();
       if(response.status == 200 && response.data.isAuthenticated){
        GoRouter.of(context).goNamed("home");     
       }
       else{
           // GoRouter.of(context).goNamed("/");
       }
      },
                   OR
      // Named routing example
      asyncNavigationCallback: () async {
        await Future.delayed(const Duration(seconds: 3));
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, "home");
        }
      },
     ...
    );
 ```
 
</a>
 </br>
<a name="immersive_mode">
  
# A splash screen using immersive mode (Hide status bar in splash screen).
## Just use "useImmersiveMode : true" to hide status bar in splash screen.
### Demo 1
<img src="https://github.com/ToyZ-95/another_flutter_splash_screen/raw/main/example/assets/immersive_demo_1.gif" width="250" height="500"/>

```dart
FlutterSplashScreen.gif(
          useImmersiveMode: true,
          gifPath: 'assets/example.gif',
          gifWidth: 269,
          gifHeight: 474,
          nextScreen: const MyHomePage(),
          duration: const Duration(milliseconds: 3515),
        );
```
 </br>

 </a>


 ## A splash screen using lottie animation.

<img src="https://github.com/ToyZ-95/another_flutter_splash_screen/raw/main/example/assets/lottie_demo.gif" width="250" height="500"/>

```dart
FlutterSplashScreen(
          useImmersiveMode: true,
          duration: const Duration(milliseconds: 2000),
          nextScreen: const MyHomePage(),
          backgroundColor: Colors.white,
          splashScreenBody: Center(
            child: Lottie.asset(
              "assets/lottie_loading_2.json",
              repeat: false,
            ),
          ),
        );
```
 </br>
 
## A splash screen with custom splash.

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
        );
```

## Additional information

We will be more than happy for your contributions.
<br />
Please contribute to [another_flutter_splash_screen](https://github.com/ToyZ-95/another_flutter_splash_screen) this github repo.
