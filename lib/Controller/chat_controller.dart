import 'package:ai_bot/APIs/apis.dart';
import 'package:ai_bot/Helper/dialog.dart';
import 'package:ai_bot/Model/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController{
    final scrollC=ScrollController();
    final textController=TextEditingController();
    final list=<Message>[Message(msg: 'Hello, How Can I help you?', messageType: MessageType.bot)].obs;
    Future<void> askQuestion() async {
        if(textController.text.trim().isNotEmpty){
            list.add(Message(msg: textController.text, messageType: MessageType.user));
            list.add(Message(msg: '', messageType: MessageType.bot));
            _scrollDown();
            final res=await APIs.getAnswer(textController.text);
            list.removeLast();
            list.add(Message(msg: res, messageType: MessageType.bot));
            _scrollDown();
            textController.text='';
        }else{
            MyDialog.info('Ask Something!');
        }
    }
    void _scrollDown(){
        scrollC.animateTo(scrollC.position.maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    }
}