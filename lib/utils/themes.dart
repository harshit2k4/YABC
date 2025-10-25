import 'package:flutter/material.dart';
import 'package:yabc/utils/colors.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    background: lBgColor,
    primary: lPrimaryColor,
    onBackground: lFontColor,
    primaryContainer: lDivColor,
    onPrimaryContainer: lFontColor,
    onSecondaryContainer: lLabelColor,
  ),
);

var darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    background: dBgColor,
    primary: dPrimaryColor,
    onBackground: dFontColor,
    primaryContainer: dDivColor,
    onPrimaryContainer: dFontColor,
    onSecondaryContainer: dLabelColor,
  ),
);
