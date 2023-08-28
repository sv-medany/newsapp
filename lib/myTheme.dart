import 'package:flutter/material.dart';

class myTheme{
  static Color greenColor=Color(0xFF39A552);
  static Color darkblue=Color(0xFF4F5A69);
  static Color redColor=Color(0xFFC91C22);
  static Color blueColor=Color(0xFF003E90);
  static Color pinkColor=Color(0xFFED1E79);
  static Color goldColor=Color(0xFFCF7E48);
  static Color blueitem=Color(0xFF4882CF);
  static Color yellow=Color(0xFFF2D352);
  static Color grey=Color(0xFF79828B);

  static ThemeData mytheme=ThemeData(
    appBarTheme: AppBarTheme(
      color: greenColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),

      ),
      elevation: 0
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
      headline2: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black
      )
    )
  );
}