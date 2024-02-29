import 'package:ai_bot/Widgets/custom_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyDialog{
//Info
static void info(String msg){
  Get.snackbar('Info',msg);
}
//Success
  static void success(String msg){
    Get.snackbar('Info',msg);
  }
  //Error
  static void Error(String msg){
    Get.snackbar('Info',msg);
  }
  //downloading
  static void showLoadingDialog(){
    Get.dialog(Center(child: CustomLoading(),));
  }
}