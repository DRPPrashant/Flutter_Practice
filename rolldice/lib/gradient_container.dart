import 'package:flutter/material.dart';
import 'package:rolldice/styled_text.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});
  //super refers to parent class here is statelesswidget
  //curley braces is used for passed name parameter

  @override
  Widget build(BuildContext context) {
    //this build method will be executed by flutter for us
    //flutter will call this method once its find your widget(i.e GradientContainer)
    //inside of flutter widget or passed to the runApp function

    // startAlignment = Alignment.center; we can reassigned
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [
            //by the const these color codes are locked here
            Color.fromARGB(255, 26, 2, 80),
            Color.fromARGB(255, 45, 7, 98)
          ],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: StyleText(),
      ),
    );
  }
}
