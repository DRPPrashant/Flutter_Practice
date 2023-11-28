import 'package:flutter/material.dart';

import 'gradient_container.dart';

void main() {
  //runApp() Its main job is actually to show some user interface
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(),
      ),
    ),
  );
}
