import 'package:ai_bot/Model/home_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
class HomeCard extends StatelessWidget{
  final HomeType homeType;
  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload=true;
    final wid=MediaQuery.of(context).size.width;
    final hig=MediaQuery.of(context).size.height;
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      onTap: homeType.onTap,
      child: Card(
        color: Colors.blue.withOpacity(0.2),
        elevation: 0,
        child: homeType.leftSide?Row(
          children: [
           Container(
             width: wid*0.35,
             padding: homeType.padded,
             child: Lottie.asset('assets/lottie/${homeType.lottie}'),
           ),
            const Spacer(),
            Text(homeType.title,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 18,letterSpacing: 1),),
            const Spacer(flex: 3,)
          ],
        ):Row(
          children: [
            const Spacer(),
            Text(homeType.title,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 18,letterSpacing: 1),),
            const Spacer(flex: 3,),
            Container(
              width: wid*0.35,
              padding: homeType.padded,
              child: Lottie.asset('assets/lottie/${homeType.lottie}'),
            ),
          ],
        ),
      ).animate()
          .scale(duration: 1.seconds),
    );
  }
}