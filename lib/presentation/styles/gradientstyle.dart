// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';

abstract class Gradients {
  Gradients._();
  static const mainColor = Color.fromARGB(255, 196, 114, 89);
  static const lightModeBackgraundColor = Color.fromARGB(255, 170, 60, 119);
  static const mainColorLight = Color.fromARGB(255, 79, 95, 141);
  static const textlanguageColorLightMode = Color(0xff000000);
  static const textNormColor = Color.fromARGB(255, 72, 157, 123);

  // ignore: prefer_const_constructors
  static final onboardingImageGradient = LinearGradient(
    colors: const <Color>[
      Gradients.mainColor,
      Gradients.mainColorLight,
      Gradients.mainColor

      //add more colors for gradient
    ],
    begin: Alignment.topLeft, //begin of the gradient color
    end: Alignment.bottomRight, //end of the gradient color
    //stops for individual color
    //set the stops number equal to numbers of color
  );
  static final onStart = const LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 178, 171, 171),
      Color.fromARGB(255, 96, 91, 91),
      //add more colors for gradient
    ],
    begin: Alignment.topLeft, //begin of the gradient color
    end: Alignment.bottomRight, //end of the gradient color
    //stops for individual color
    //set the stops number equal to numbers of color
  );
  // ignore: prefer_const_constructors
  static final onboardingImageGradient5 = LinearGradient(
    colors: const [
      Colors.orange,
      Colors.orangeAccent,
      Colors.red,

      //add more colors for gradient
    ],
    begin: Alignment.topLeft, //begin of the gradient color
    end: Alignment.bottomRight, //end of the gradient color
  );

  // ignore: prefer_const_constructors
  static final onboardingImageGradient1 = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: const [Colors.purple, Colors.blue]);

  // ignore: prefer_const_constructors
  static final onboardingImageGradient2 = LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: const [Colors.red, Colors.yellow, Colors.blue, Colors.purple]);

  static final onboardingImageGradient3 = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.green.shade800,
        Colors.greenAccent,
        Colors.green.shade800
      ]);

  // ignore: prefer_const_constructors
  static final onboardingImageGradient4 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: const [
      Color(0xff002fff),
      Color(0xff00f4ff),
      Color(0xff002fff),
    ],
  );

  static final onboardingImageGradient6 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      const Color(0xffFF6000),
      Colors.orange.shade100,
      const Color(0xffFF6000),
    ],
  );

  static final onboardingImageGradient7 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.deepPurple,
      Colors.purple.shade100,
      Colors.deepPurple,
    ],
  );

  static final onboardingImageGradient8 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      const Color(0xffFF0000),
      Colors.red.shade100,
      const Color(0xffFF0000),
    ],
  );
}
