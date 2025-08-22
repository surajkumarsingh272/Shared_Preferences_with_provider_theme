
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  var themeMode=ThemeMode.light;

  void toggleTheme(){
    themeMode=themeMode==ThemeMode.light?ThemeMode.dark:ThemeMode.light;
    notifyListeners();
  }
}