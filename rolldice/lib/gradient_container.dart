import 'package:flutter/material.dart';
import 'package:rolldice/styled_text.dart';

var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;


//2nd way
class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key}); //named parameter
  //super refers to parent class here is statelesswidget
  //curley braces is used for passed name parameter

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
        child: StyleText('Hello World!'),
      ),
    );
  }
}



// 1st Way: 

// class GradientContainer extends StatelessWidget {
//   const GradientContainer({super.key, required this.colors}); //named parameter
//   //super refers to parent class here is statelesswidget
//   //curley braces is used for passed name parameter

//   final List<Color> colors;

//   @override
//   Widget build(BuildContext context) {
//     //this build method will be executed by flutter for us
//     //flutter will call this method once its find your widget(i.e GradientContainer)
//     //inside of flutter widget or passed to the runApp function

//     // startAlignment = Alignment.center; we can reassigned
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           // colors: const [
//           //   //by the const these color codes are locked here
//           //   Color.fromARGB(255, 18, 6, 48),
//           //   Color.fromARGB(255, 133, 126, 144)
//           // ],
//           colors: colors,
//           begin: startAlignment,
//           end: endAlignment,
//         ),
//       ),
//       child: const Center(
//         child: StyleText('Hello World!'),
//       ),
//     );
//   }
// }
