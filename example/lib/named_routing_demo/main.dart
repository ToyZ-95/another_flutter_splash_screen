import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:example/go_router_demo/go_router_splash_screen.dart';
import 'package:example/named_routing_demo/named_routing_splash_screen.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
          case "root":
          case "splashScreen":
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return const NamedRoutingSplashScreen();
              },
            );

          case "home":
            return MaterialPageRoute(
              builder: (BuildContext context) {
                return const NamedRoutingHomePage();
              },
            );
        }
        return null;
      },
    );
  }
}

class NamedRoutingHomePage extends StatefulWidget {
  const NamedRoutingHomePage({super.key});

  @override
  State<NamedRoutingHomePage> createState() => _NamedRoutingHomePageState();
}

class _NamedRoutingHomePageState extends State<NamedRoutingHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Named Routing Demo"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have navigated using Named Routing',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
