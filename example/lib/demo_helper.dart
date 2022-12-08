import 'package:example/demos/gif_demo.dart';
import 'package:example/demos/opacity_demo.dart';
import 'package:flutter/material.dart';

enum DemoType {
  gif,
  opacity,
}

class DemoHelper extends StatefulWidget {
  DemoHelper({super.key, required this.demoType});

  DemoType demoType;

  @override
  State<DemoHelper> createState() => _DemoHelperState();
}

class _DemoHelperState extends State<DemoHelper> {
  @override
  Widget build(BuildContext context) {
    switch (widget.demoType) {
      case DemoType.gif:
        return const GifDemo();
      case DemoType.opacity:
        return const Opacitydemo();
      default:
        return Container();
    }
  }
}
