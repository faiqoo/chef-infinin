import 'package:flutter/material.dart';

extension StringToColor on String {
  static const start = 1;
  static const end = 7;
  static const radix = 16;
  static const complement = 0xFF000000;

  // The function that bind the color from hexa into a Flutter Color
  Color? colorFromHex() {
    return Color(
      int.parse(
            substring(start, end),
            radix: radix,
          ) +
          complement,
    );
  }

  // The function that bind the color name into a Flutter Color
  Color? toColor() {
    try {
      if (colors.containsKey(this)) {
        return colors[this];
      }
      return colorFromHex();
    } catch (e) {
      return Colors.white;
    }
  }
}

const Map<String, Color> colors = {
  'transparent': Colors.transparent,
  'black': Colors.black,
  'white': Colors.white,
  'green': Colors.green,
  'greenAccent': Colors.greenAccent,
  'lightGreen': Colors.lightGreen,
  'lightGreenAccent': Colors.lightGreenAccent,
  'blue': Colors.blue,
  'blueAccent': Colors.blueAccent,
  'blueGrey': Colors.blueGrey,
  'lightBlue': Colors.lightBlue,
  'lightBlueAccent': Colors.lightBlueAccent,
  'red': Colors.red,
  'redAccent': Colors.redAccent,
  'orange': Colors.orange,
  'orangeAccent': Colors.orangeAccent,
  'deepOrange': Colors.deepOrange,
  'deepOrangeAccent': Colors.deepOrangeAccent,
  'brown': Colors.brown,
  'amber': Colors.amber,
  'amberAccent': Colors.amberAccent,
  'yellow': Colors.yellow,
  'yellowAccent': Colors.yellowAccent,
  'cyan': Colors.cyan,
  'cyanAccent': Colors.cyanAccent,
  'purple': Colors.purple,
  'purpleAccent': Colors.purpleAccent,
  'deepPurple': Colors.deepPurple,
  'deepPurpleAccent': Colors.deepPurpleAccent,
  'grey': Colors.grey,
  'indigo': Colors.indigo,
  'indigoAccent': Colors.indigoAccent,
  'lime': Colors.lime,
  'limeAccent': Colors.limeAccent,
  'pink': Colors.pink,
  'pinkAccent': Colors.pinkAccent,
  'teal': Colors.teal,
  'tealAccent': Colors.tealAccent,
};
