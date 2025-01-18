import 'package:flutter/material.dart';

List<Color> _colors = [
  Colors.purple.shade300,
  Colors.green.shade300,
  Colors.red.shade400
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0});

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colors[selectedColor],
    );
  }
}
