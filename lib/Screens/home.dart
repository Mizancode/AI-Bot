import 'package:ai_bot/APIs/apis.dart';
import 'package:ai_bot/Helper/pref.dart';
import 'package:ai_bot/Model/home_type.dart';
import 'package:ai_bot/Widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _isDarkMode=Pref.isDarkMode.obs;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.onBoarding=false;
  }
  @override
  Widget build(BuildContext context) {
    final wid=MediaQuery.of(context).size.width;
    final hig=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI BOT',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        actions: [
          IconButton(onPressed: (){
            Get.changeThemeMode(_isDarkMode.value?ThemeMode.light:ThemeMode.dark);
            _isDarkMode.value=!_isDarkMode.value;
            Pref.isDarkMode=_isDarkMode.value;
          }, icon: Obx(()=>Icon( _isDarkMode.value?Icons.brightness_2_rounded:Icons.brightness_4_rounded,size: 28,)))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: wid*0.04,vertical: hig*0.015),
        children: HomeType.values.map((e) => HomeCard(homeType: e)).toList()
    )
    );
  }
}