import 'package:flutter/material.dart';

BottomNavigationBarThemeData bottomBarTheme =
    const BottomNavigationBarThemeData(
  backgroundColor: Colors.black,
  elevation: 0,
  selectedIconTheme:
      IconThemeData(color: Colors.deepOrange, opacity: 1.0, size: 26),
  unselectedIconTheme:
      IconThemeData(color: Colors.deepOrange, opacity: 0.5, size: 26),
  showSelectedLabels: false,
  showUnselectedLabels: false,
  selectedLabelStyle: TextStyle(fontSize: 0),
  unselectedLabelStyle: TextStyle(fontSize: 0),
  type: BottomNavigationBarType.fixed,
  enableFeedback: false,
);

ButtonThemeData buttonTheme = const ButtonThemeData(
  padding: EdgeInsets.zero,
  minWidth: 0,
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
);

TextButtonThemeData textButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    minimumSize: Size.zero,
    padding: EdgeInsets.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ),
);

ThemeData bwarkTheme = ThemeData(
  bottomNavigationBarTheme: bottomBarTheme,
  buttonTheme: buttonTheme,
  iconTheme: const IconThemeData(color: Colors.deepOrange, size: 26),
  textButtonTheme: textButtonTheme,
);
