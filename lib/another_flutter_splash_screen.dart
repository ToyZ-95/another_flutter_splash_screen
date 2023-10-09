library another_flutter_splash_screen;

import 'package:another_flutter_splash_screen/enums/splash_type_enum.dart';
import 'package:another_flutter_splash_screen/splashs/fade_In_splash.dart';
import 'package:another_flutter_splash_screen/splashs/gif_splash.dart';
import 'package:another_flutter_splash_screen/splashs/scale_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef AsyncCallback = Future Function();

// ignore: must_be_immutable
class FlutterSplashScreen extends StatefulWidget {
  FlutterSplashScreen({
    Key? key,
    this.duration,
    this.backgroundColor = Colors.black,
    this.splashScreenBody,
    this.nextScreen,
    this.setStateTimer = const Duration(milliseconds: 100),
    this.setStateCallback,
    this.onInit,
    this.onEnd,
    this.asyncNavigationCallback,
    this.useImmersiveMode = false,
  }) : super(key: key);

  /// [Duration] for how long flutter splash screen should stay.
  /// #### NOTE: Do not use [duration] with [asyncNavigationCallback] as [asyncNavigationCallback]'s aim is to navigate only after call back completes.
  /// ```dart
  /// duration: const Duration(milliseconds: 2000),
  /// ```
  Duration? duration;

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

  /// Default screen to which app should navigate to after flutter splash screen if [asyncNavigationCallback] is not provided.

  /// ```dart
  ///  nextScreen: const MyHomePage(),
  /// ```
  Widget? nextScreen;

  /// An [AsyncCallback] used to perform some operations asynchronously.
  /// E.g. Loading data from server before moving to next screen.
  /// Do not use [duration] while using asyncCallback. It just doesn't make sense.
  /// ```dart
  /// asyncCallback: () async {
  ///     String? token = await CredentialStore.getBrearerToken();
  ///    if (token != null && token.isNotEmpty) {
  ///      await getHomeScreenData();
  ///      GoRouter.of(context).goNamed("home");
  ///                 OR
  ///      Navigator.pushReplacementNamed(context, "home");
  ///    } else {
  ///      GoRouter.of(context).goNamed("/");
  ///                 OR
  ///      Navigator.pushReplacementNamed(context, "/");
  ///    }
  /// }
  /// ```
  AsyncCallback? asyncNavigationCallback;

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
  /// onEnd: () async {
  ///   if (isUserAlreadyLoggedIn) {
  ///       CustomNavigator.instance.replace(defaultNextScreen: const Dashboard());
  ///   }
  ///   else {
  ///       CustomNavigator.instance.replace(defaultNextScreen: LoginScreen());
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

  double _scale = 0;

  /// A [VoidCallback] which will be triggered after flutter splash screen [Duration].
  /// ```dart
  /// onAnimationEnd: ()  {
  ///   debugPrint("Animation End");
  /// }
  /// ```
  VoidCallback? onAnimationEnd;

  /// A child [Widget] which will be shown during opacity animation.
  /// ```dart
  /// childWidget : SizedBox(
  ///          height: 200,
  ///          width: 200,
  ///          child: Image.asset("assets/dart_bird.png"),
  ///       )
  /// ```
  Widget? childWidget;

  /// [Duration] to complate opacity animation.
  /// ```dart
  /// animationDuration: const Duration(milliseconds: 2000),
  /// ```
  Duration? animationDuration;

  //#endregion

  SplashType splashType = SplashType.custom;

  /// Takes curve of animation.
  /// ```dart
  /// animationCurve : Curves.ease;
  /// ```
  Curve animationCurve = Curves.ease;

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

  /// Hides status bar and shows splash screen on full screen.
  ///
  /// ```dart
  /// useImmersiveMode: true,
  /// ```
  bool useImmersiveMode;

  @override
  State<FlutterSplashScreen> createState() => _FlutterSplashScreenState();

  /// Provides ready-made gif templated splash;
  FlutterSplashScreen.gif({
    super.key,
    required this.gifPath,
    required this.gifWidth,
    required this.gifHeight,
    this.nextScreen,
    this.duration,
    this.backgroundColor = Colors.black,
    this.setStateTimer = const Duration(milliseconds: 100),
    this.setStateCallback,
    this.onInit,
    this.onEnd,
    this.asyncNavigationCallback,
    this.backgroundImage,
    this.gradient,
    this.useImmersiveMode = false,
  }) {
    splashType = SplashType.gif;
  }

  /// Provides ready-made fadeIn templated splash;
  FlutterSplashScreen.fadeIn({
    super.key,
    this.nextScreen,
    required this.childWidget,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(milliseconds: 2000),
    this.duration,
    this.backgroundColor = Colors.black,
    this.setStateTimer = const Duration(milliseconds: 200),
    this.onAnimationEnd,
    this.onInit,
    this.onEnd,
    this.asyncNavigationCallback,
    this.backgroundImage,
    this.gradient,
    this.useImmersiveMode = false,
  }) {
    splashType = SplashType.fadeIn;

    setStateCallback = () {
      _opacity = 1;
    };
  }

  /// Provides ready-made fadeIn templated splash;
  FlutterSplashScreen.scale({
    super.key,
    this.nextScreen,
    required this.childWidget,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(milliseconds: 2000),
    this.duration,
    this.backgroundColor = Colors.black,
    this.setStateTimer = const Duration(milliseconds: 200),
    this.onAnimationEnd,
    this.onInit,
    this.onEnd,
    this.asyncNavigationCallback,
    this.backgroundImage,
    this.gradient,
    this.useImmersiveMode = false,
  }) {
    splashType = SplashType.scale;

    setStateCallback = () {
      _scale = 1;
    };
  }
}

class _FlutterSplashScreenState extends State<FlutterSplashScreen> {
  @override
  void initState() {
    super.initState();

    if (widget.useImmersiveMode) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    }

    widget.onInit?.call();
  }

  @override
  didChangeDependencies() async {
    super.didChangeDependencies();

    Future.delayed(widget.setStateTimer, () {
      if (mounted) {
        widget.setStateCallback?.call();
        setState(() {});
      }
    });

    if (widget.asyncNavigationCallback != null) {
      assert(widget.duration == null,
          "Duration must be null when you're using asyncNavigationCallback as its main purpose is to navigate to next screen only after some api calls or some code");
      await widget.asyncNavigationCallback?.call();
    } else {
      widget.duration ??= const Duration(seconds: 2);
    }

    Future.delayed(widget.duration ?? const Duration(), () {
      widget.onEnd?.call();

      if (widget.nextScreen == null) {
        return;
      }

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
  void dispose() {
    super.dispose();
    if (widget.useImmersiveMode) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.splashType == SplashType.gif) {
      return GifSplash()
        ..backgroundColor = widget.backgroundColor
        ..gifPath = widget.gifPath
        ..gifHeight = widget.gifHeight
        ..gifWidth = widget.gifWidth
        ..backgroundImage = widget.backgroundImage
        ..gradient = widget.gradient;
    } else if (widget.splashType == SplashType.fadeIn) {
      return FadeInSplash()
        ..opacity = widget._opacity
        ..backgroundColor = widget.backgroundColor
        ..onFadeInEnd = widget.onAnimationEnd
        ..fadeInChildWidget = widget.childWidget
        ..fadeInAnimationDuration = widget.animationDuration
        ..animationCurve = widget.animationCurve
        ..backgroundImage = widget.backgroundImage
        ..gradient = widget.gradient;
    } else if (widget.splashType == SplashType.scale) {
      return ScaleSplash()
        ..scale = widget._scale
        ..backgroundColor = widget.backgroundColor
        ..onScaleEnd = widget.onAnimationEnd
        ..scaleChildWidget = widget.childWidget
        ..scaleAnimationDuration = widget.animationDuration
        ..animationCurve = widget.animationCurve
        ..backgroundImage = widget.backgroundImage
        ..gradient = widget.gradient;
    } else {
      return Scaffold(
        backgroundColor: widget.backgroundColor,
        body: widget.splashScreenBody,
      );
    }
  }
}
