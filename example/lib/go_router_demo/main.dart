import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:example/go_router_demo/go_router_splash_screen.dart';
import 'package:example/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: GoRouter(
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            name: '/',
            builder: (BuildContext context, GoRouterState state) {
              return const GoRouterSplashScreen();
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'home',
                name: 'home',
                builder: (BuildContext context, GoRouterState state) {
                  return const GoRouterHomePage();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GoRouterHomePage extends StatefulWidget {
  const GoRouterHomePage({super.key});

  @override
  State<GoRouterHomePage> createState() => _GoRouterHomePageState();
}

class _GoRouterHomePageState extends State<GoRouterHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Go Router Demo"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have navigated using Go Router',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
