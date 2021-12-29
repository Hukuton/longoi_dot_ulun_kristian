import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Utility {
  static String getInitial(String text) {
    return text.substring(0, text.indexOf('.'));
  }

  static Future<bool> checkConnection() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());

    if ((connectivityResult == ConnectivityResult.mobile) ||
        (connectivityResult == ConnectivityResult.wifi)) {
      return Future<bool>.value(true);
    } else {
      return Future<bool>.value(false);
    }
  }

  static final Map<String, String> _superscript = {
    '0': '\u2070',
    '1': '\u00B9',
    '2': '\u00B2',
    '3': '\u00B3',
    '4': '\u2074',
    '5': '\u2075',
    '6': '\u2076',
    '7': '\u2077',
    '8': '\u2078',
    '9': '\u2079',
  };

  static String getSuperscriptNumber(int number) {
    int length = number.toString().length;
    String numString = '';
    for (int i = 0; i < length; i++) {
      numString += _superscript[number.toString()[i]].toString();
    }
    return numString;
  }

  /// Darken ranges from 0.0 to 1.0
  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  /// Lighten ranges from 0.0 to 1.0
  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
