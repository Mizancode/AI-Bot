import 'package:ai_bot/Helper/pref.dart';
import 'package:ai_bot/Screens/home.dart';
import 'package:ai_bot/Screens/on_boarding.dart';
import 'package:ai_bot/Widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';
class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Get.off(()=>Pref.onBoarding? const OnBoardingScreen():const HomeScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    mq=MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            const Spacer(flex: 2,),
            Card(
              //color: Colors.blue,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Padding(
                padding:  EdgeInsets.all(mq.width*0.05),
                child: Image.asset('assets/images/chatbot.png',width: mq.width*0.4,),
              ),
            ),
            const Spacer(),
            CustomLoading(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}