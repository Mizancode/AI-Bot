import 'package:ai_bot/Helper/pref.dart';
import 'package:ai_bot/Screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'APIs/appwrite.dart';
late Size mq;
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Pref.initialize();
  AppWrite.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: Pref.defaultTheme(),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(
              elevation: 1,
              centerTitle: true,
              titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)
          )
      ),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.blue),
          titleTextStyle: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w500)
        )
      ),
      title: 'AI BOT',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
extension AppTheme on ThemeData{
  Color get lightTextColor=>brightness==Brightness.dark?Colors.white70:Colors.black54;
  Color get btnColor=>brightness==Brightness.dark?Colors.cyan.withOpacity(0.5):Colors.blue;
}