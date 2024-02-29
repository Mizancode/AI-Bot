import 'package:ai_bot/Features/chatBot_feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Features/image_feature.dart';
import '../Features/language_translator.dart';

enum HomeType{aiChatBot, aiImage,aiTranslator}
extension MyHomeType on HomeType{
  String get title=> switch(this){
    HomeType.aiChatBot=>'AI ChatBot',
    HomeType.aiImage=>'AI Image Creator',
    HomeType.aiTranslator=>'AI Translator'
  };
  String get lottie=> switch(this){
    HomeType.aiChatBot=>'hand_wavie.json',
    HomeType.aiImage=>'ai_play.json',
    HomeType.aiTranslator=>'welcome.json'
  };
  bool get leftSide=> switch(this){
    HomeType.aiChatBot=>true,
    HomeType.aiImage=>false,
    HomeType.aiTranslator=>true
  };
  EdgeInsets get padded=>switch(this){
    HomeType.aiChatBot=>EdgeInsets.zero,
    HomeType.aiImage=>const EdgeInsets.all(20),
    HomeType.aiTranslator=>EdgeInsets.zero
  };
  VoidCallback get onTap => switch(this){
    HomeType.aiChatBot=> ()=> Get.to(()=>const ChatBotFeature()),
    HomeType.aiImage=> ()=> Get.to(()=>const ImageFeature()),
    HomeType.aiTranslator=> ()=> Get.to(()=>const LanguageFeature())
  };
}