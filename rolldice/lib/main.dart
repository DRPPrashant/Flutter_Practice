import 'package:flutter/material.dart';
import 'package:rolldice/gradient_container.dart';

void main() {
  //runApp() Its main job is actually to show some user interface
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer(),
      ),
    ),
  );
}
