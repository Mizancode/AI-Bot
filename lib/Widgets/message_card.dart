import 'package:ai_bot/Model/message.dart';
import 'package:ai_bot/main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({super.key, required this.message});
   @override
  Widget build(BuildContext context) {
     final hei=MediaQuery.of(context).size.height;
     final wid=MediaQuery.of(context).size.width;
    return message.messageType==MessageType.bot? Row(
      children: [
        const SizedBox(width: 6,),
        CircleAvatar(
      radius: 18,
      backgroundColor: Colors.white,
      child: Image.asset('assets/images/chatbot.png',width: 24,),),
        Container(
            constraints: BoxConstraints(
                maxWidth: wid*0.6
            ),
          margin: EdgeInsets.only(bottom: hei*0.02,left: wid*0.02),
          padding: EdgeInsets.symmetric(vertical: hei*0.01,horizontal: wid*0.02),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).lightTextColor),
            borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15),topRight: Radius.circular(15),topLeft: Radius.circular(15))
          ),
            child: message.msg.isEmpty?AnimatedTextKit(
     animatedTexts: [
     TypewriterAnimatedText(
     'Please Wait...',
     speed: const Duration(milliseconds: 100),
     ),
     ],
              repeatForever: true,
     ):Text(message.msg,textAlign: TextAlign.center,))
      ],
    ):Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            constraints: BoxConstraints(
              maxWidth: wid*0.6
            ),
            margin: EdgeInsets.only(bottom: hei*0.02,right: wid*0.02),
            padding: EdgeInsets.symmetric(vertical: hei*0.01,horizontal: wid*0.02),
            decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).lightTextColor),
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),topRight: Radius.circular(15),topLeft: Radius.circular(15))
            ),
            child: Text(message.msg,textAlign: TextAlign.center,),),
        const CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: Icon(Icons.person,color: Colors.blue,)
        ),
        const SizedBox(width: 6,),
      ],
    );
  }
}