import 'package:ai_bot/Model/on_board.dart';
import 'package:ai_bot/Screens/home.dart';
import 'package:ai_bot/Widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../main.dart';
class OnBoardingScreen extends StatelessWidget{
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final control=PageController();
    final list=[
      OnBoard(title: 'Ask Me Anything...!', subTitle: 'I can be your best Friend & You can ask me anything & I will help you!', lottie: 'welcome.json'),
      OnBoard(title: 'Imagination to Reality...!', subTitle: 'Just Imagine anything and let me know, I will create something wonderful for you!', lottie: 'ai_play.json')
    ];
    final lastIdx=list.length-1;
    mq=MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
        controller: control,
          itemCount: list.length,
          itemBuilder: (context,index){
            return Column(
              children: [
                Lottie.asset('assets/lottie/${list[index].lottie}',height: mq.height*0.6,width: index==lastIdx? mq.width*0.7 : null),
                Text(list[index].title,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w900,letterSpacing: 0.5),),
                SizedBox(height: mq.height*0.01,),
                SizedBox(
                    width: mq.width*0.7,
                    child: Text(list[index].subTitle,style: TextStyle(fontSize: 13.5,letterSpacing: 0.5,color: Theme.of(context).lightTextColor),textAlign: TextAlign.center,)),
                const Spacer(),
                Wrap(
                    spacing: 10,
                    children:
                    List.generate(2, (i) => Container(
                      width: i==index? 15 : 10,
                      height: 8,
                      decoration: BoxDecoration(
                          color: i==index ? Colors.blue : Colors.grey,
                          borderRadius: const BorderRadius.all(Radius.circular(5))
                      ),
                    ))
                ),
                const Spacer(),
                CustomeBtn(onTap: (){
                  if(index==lastIdx){
                    Get.off(()=>const HomeScreen());
                  }else{
                    control.nextPage(duration: const Duration(seconds: 1), curve: Curves.ease);
                  }
                },text: index==lastIdx ? 'Finish' : 'Next',),
                const Spacer(flex: 2,)
              ],
            );
      })
    );
  }
}