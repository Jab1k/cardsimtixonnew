// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';

abstract class Borderradiuses {
  Borderradiuses._();
  static const mainColor = Color.fromARGB(255, 196, 114, 89);
  static const lightModeBackgraundColor = Color.fromARGB(255, 170, 60, 119);
  static const mainColorLight = Color.fromARGB(255, 79, 95, 141);
  static const textlanguageColorLightMode = Color(0xff000000);
  static const textNormColor = Color.fromARGB(255, 72, 157, 123);

  static final unOltinchi = const BorderRadius.all(Radius.circular(16));
  static final onlyTop = const BorderRadius.vertical(
    top: Radius.circular(20),
  );
}
