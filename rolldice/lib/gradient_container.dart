import 'package:flutter/material.dart';
import 'package:rolldice/dice_roller.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key}); //named parameter
  //super refers to parent class here is statelesswidget
  //curley braces is used for passed name parameter

  const GradientContainer.purple({super.key})
      : color1 = Colors.deepPurple,
        color2 = Colors.indigo;

  final Color color1;
  final Color color2;

  

  @override
  Widget build(BuildContext context) {
    //this build method will be executed by flutter for us
    //flutter will call this method once its find your widget(i.e GradientContainer)
    //inside of flutter widget or passed to the runApp function

    // startAlignment = Alignment.center; we can reassigned
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
