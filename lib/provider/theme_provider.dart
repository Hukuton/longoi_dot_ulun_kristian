import 'package:flutter/material.dart';
import 'package:longoi_dot_ulun_kristian/utility/fonts_theme.dart';
import 'package:longoi_dot_ulun_kristian/utility/prefs.dart';
import 'package:longoi_dot_ulun_kristian/utility/utility.dart';
import 'package:material_color_gen/material_color_gen.dart';

class ThemeProvider extends ChangeNotifier {
  static const String modeKey = 'light_or_dark';
  static const String colorSwatchKey = 'swatch_color';
  static const String fontKey = 'font_key';

  static const int defaultSwatchColor = 4278234305;

  late ThemeData _themeData;
  bool _isDarkMode = false;
  late Color _colorSwatch;
  late String _fontFamily;

  bool get isDarkMode => _isDarkMode;
  String get fontFamily => _fontFamily;
  final BuildContext _context;
  late final TextTheme _textTheme;

  ThemeProvider(this._context) {
    init();
  }

  void init() {
    _isDarkMode = SharedPrefs.getBool(modeKey) ?? false;
    _fontFamily = SharedPrefs.getString(fontKey) ?? 'Roboto';
    _textTheme =
        FontsTheme.getTextTheme(_fontFamily, Theme.of(_context).textTheme);
    if (_isDarkMode) {
      _themeData = setToDark();
    } else {
      _themeData = setToLight();
    }
  }

  ThemeData setToDark() {
    _themeData = ThemeData.dark().copyWith(
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all<Color>(
          Colors.black12,
        ),
        trackColor: MaterialStateProperty.all<Color>(
          Colors.grey,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            Colors.white,
          ),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.white12,
          ), //button color
          foregroundColor: MaterialStateProperty.all<Color>(
            Colors.white,
          ),
        ),
      ),
      textTheme: _textTheme.apply(bodyColor: Colors.white),
    );
    return _themeData;
  }

  ThemeData setToLight() {
    _colorSwatch =
        Color(SharedPrefs.getInt(colorSwatchKey) ?? defaultSwatchColor);
    //Color(SharedPrefs.getInt(colorSwatchKey) ?? Colors.blue.value);
    _themeData = ThemeData(
        primarySwatch: _colorSwatch.toMaterialColor(),
        textTheme: _textTheme,
        iconTheme: IconThemeData(color: _colorSwatch));
    return _themeData;
  }

  set isDarkMode(bool value) {
    _isDarkMode = value;
    //print('dark mode $value');
    SharedPrefs.setBool(modeKey, _isDarkMode);
    notifyListeners();
  }

  getTheme() => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  setThemeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  setFontFamily(String? fontFamily) {
    _themeData.textTheme.apply(
      fontFamily: fontFamily,
    );
    _fontFamily = fontFamily!;
    SharedPrefs.setString(fontKey, _fontFamily);
    notifyListeners();
  }

  setPrimarySwatch(Color _colorSwatch) {
    SharedPrefs.setInt(colorSwatchKey, _colorSwatch.value);
    _themeData = ThemeData(primarySwatch: _colorSwatch.toMaterialColor());
    notifyListeners();
  }

  Color getPrimaryTextColor() {
    return _isDarkMode
        ? Utility.lighten(_colorSwatch, 0.7)
        : Utility.darken(_colorSwatch, 0.25);
  }
}
