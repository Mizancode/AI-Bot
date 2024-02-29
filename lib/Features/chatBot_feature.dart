import 'package:ai_bot/Controller/chat_controller.dart';
import 'package:ai_bot/Widgets/message_card.dart';
import 'package:ai_bot/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ChatBotFeature extends StatefulWidget{
  const ChatBotFeature({super.key});

  @override
  State<ChatBotFeature> createState() => _ChatBotFeatureState();
}

class _ChatBotFeatureState extends State<ChatBotFeature> {
  final _chatController=ChatController();
  @override
  Widget build(BuildContext context) {
    final hei=MediaQuery.of(context).size.height;
    final wid=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI chat Assistant'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _chatController.textController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  isDense: true,
                  hintText: 'Ask me anything you want...',
                  hintStyle: const TextStyle(fontSize: 14),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  )
                ),
                onTapOutside: (e)=> FocusScope.of(context).unfocus(),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).btnColor,
              child: IconButton(
                onPressed: (){
                  _chatController.askQuestion();
                },
                icon: const Icon(Icons.rocket_launch_rounded,color: Colors.white,size: 28,),
              ),
            )
          ],
        ),
      ),
      body: Obx(
          ()=> ListView(
            controller: _chatController.scrollC,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(top: hei*0.02,bottom: hei*0.1),
          children: _chatController.list.map((e) => (MessageCard(message: e))).toList(),
        ),
      ),
    );
  }
}