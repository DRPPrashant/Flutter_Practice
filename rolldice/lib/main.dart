import 'package:flutter/material.dart';
import 'package:rolldice/gradient_container.dart';

void main() {
  //runApp() Its main job is actually to show some user interface
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer(
          const Color.fromARGB(255, 33, 5, 100),
          const Color.fromARGB(255, 68, 21, 149),
        ),
      ),
    ),
  );
}
