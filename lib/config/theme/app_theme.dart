import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF1D94F5);
// _atributo privada por el guion bajo
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  final int selectedColor;
  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'Colores existentes entre 0 y ${_colorThemes.length}');
  // el tipo de themedata es el que espera como atributo MaterialApp
  ThemeData theme() {
    return ThemeData(colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
