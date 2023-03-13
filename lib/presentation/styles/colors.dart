import 'package:cardsnew/presentation/styles/borderradiues.dart';
import 'package:flutter/material.dart';

import 'gradientstyle.dart';

class Style {
  Style._();
  static const primaryColor = Color(0xffF43F5E);
  static const cardscolor = Color.fromARGB(172, 226, 189, 178);
  static const cardscolor2 = Color(0xff66CD7D);
  static const cardscolor3 = Color.fromARGB(255, 205, 193, 102);
  static const cardscolor4 = Color(0xffE5BBF4);
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const darkBgcolorOfApp = Color(0xff0D0D0D);
  static const linearGradient = LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [
        Color(0xffFF1843),
        Color(0xffFF7E95),
      ]);

  static const primaryDisabledColor = Color.fromARGB(244, 235, 134, 164);

  static qopqora({double size = 20, Color textColor = Style.blackColor}) =>
      TextStyle(
        fontSize: size,
        color: textColor,
        fontWeight: FontWeight.w500,
      );

  static oppoq({double size = 13, Color textColor = Style.whiteColor}) =>
      TextStyle(
        fontSize: size,
        color: textColor,
        fontWeight: FontWeight.w500,
      );

  static textNormSizeLightMode(
          {double size = 17, Color textColor = Gradients.mainColor}) =>
      TextStyle(
        fontSize: size,
        color: textColor,
        fontWeight: FontWeight.w600,
      );
  static textfromfeilds() => InputDecoration(
        labelText: '+998',
        labelStyle: Style.qopqora(),
        suffixIcon: const Icon(Icons.contact_emergency_rounded),
        prefix: const Text('+998'),
        prefixStyle: Style.qopqora(),
        border: OutlineInputBorder(
          borderRadius: Borderradiuses.unOltinchi,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: Borderradiuses.unOltinchi,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: Borderradiuses.unOltinchi,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: Borderradiuses.unOltinchi,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: Borderradiuses.unOltinchi,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: Borderradiuses.unOltinchi,
        ),
      );

  static dumoloq({
    Color textColor = Colors.blue,
  }) =>
      // ignore: prefer_const_constructors
      BoxDecoration(
        // ignore: prefer_const_constructors
        color: textColor,
        shape: BoxShape.circle,
      );
  
  static addushi({
    Color textColor = Colors.white,
  }) =>
      // ignore: prefer_const_constructors
      BoxDecoration(
        // ignore: prefer_const_constructors
        color: textColor,
        borderRadius: Borderradiuses.unOltinchi,
      );
}
