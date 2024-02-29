import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
class Pref{
  static late Box _box;
  static Future<void> initialize() async {
    Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
    _box=Hive.box(name: 'MyData');
  }
  static bool get onBoarding => _box.get('onBoarding',defaultValue: true);
  static set onBoarding(bool b)=> _box.put('onBoarding', b);

  static bool get isDarkMode=> _box.get('isDarkMode') ?? false;
  static set isDarkMode(bool v)=> _box.put('isDarkMode',v);
  static ThemeMode defaultTheme(){
     final data= _box.get('isDarkMode');
     if(data==null)return ThemeMode.system;
     if(data==true)return ThemeMode.dark;
     return ThemeMode.light;
  }
}