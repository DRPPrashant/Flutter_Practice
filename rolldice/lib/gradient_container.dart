import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});
  //super refers to parent class here is statelesswidget
  //curley braces is used for passed name parameter

  @override
  Widget build(BuildContext context) {
    //this build method will be executed by flutter for us
    //flutter will call this method once its find your widget(i.e GradientContainer)
    //inside of flutter widget or passed to the runApp function
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 26, 2, 80),
            Color.fromARGB(255, 45, 7, 98)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: StyleText(),
      ),
    );
  }
}

class StyleText extends StatelessWidget {
  const StyleText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Hello World!',
      style: TextStyle(
        fontSize: 28,
        color: Colors.white,
      ),
    );
  }
}
