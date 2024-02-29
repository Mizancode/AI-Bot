import 'dart:io';

import 'package:ai_bot/APIs/apis.dart';
import 'package:ai_bot/Helper/dialog.dart';
import 'package:ai_bot/Helper/global.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/cupertino.dart';
import 'package:gallery_saver_updated/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

enum Status{none,loading,completed}

class ImageController extends GetxController{
  final status=Status.none.obs;
  final Ctr=TextEditingController();
  final url=''.obs;
  final imageList=<String>[].obs;
  Future<void> generateImage()async{
    OpenAI.apiKey = apiKey;
    if(Ctr.text.trim().isNotEmpty){
      status.value=Status.loading;
         OpenAIImageModel image = await OpenAI.instance.image.create(
           prompt: Ctr.text,
           n: 1,
           size: OpenAIImageSize.size512,
           responseFormat: OpenAIImageResponseFormat.url,
         );
         url.value=image.data[0].url.toString();
         status.value=Status.completed;
    }else{
      MyDialog.info('Provide some beautiful image description!');
    }
  }
  void downloadImage() async {
    try{
      MyDialog.showLoadingDialog();
      final bytes=(await get(Uri.parse(url.value))).bodyBytes;
      final dir=await getTemporaryDirectory();
      final file=await File('${dir.path}/ai_image.png').writeAsBytes(bytes);
      await GallerySaver.saveImage(file.path,albumName: 'AI BOT').then((success) {
        Get.back();
        MyDialog.success('Image Download to Gallery');
      });
    // ignore: empty_catches
    }catch(e) {
      Get.back();
      MyDialog.success('Some Error Occurred, try after sometime!');
    }
  }
  void shareImage() async {
    try{
      MyDialog.showLoadingDialog();
      final bytes=(await get(Uri.parse(url.value))).bodyBytes;
      final dir=await getTemporaryDirectory();
      final file=await File('${dir.path}/ai_image.png').writeAsBytes(bytes);
      Get.back();
      await Share.shareXFiles([XFile((file.path))],text: 'Chack out this amazing Image created by Ai Assistant App By Mizan Sheikh');
      // ignore: empty_catches
    }catch(e) {
      Get.back();
      MyDialog.success('Some Error Occurred, try after sometime!');

    }
  }
  Future<void> searchAiImages()async{
    if(Ctr.text.trim().isNotEmpty){
      status.value=Status.loading;
     imageList.value=await APIs.searchAiImages(Ctr.text);
     if(imageList.isEmpty){
       MyDialog.Error('Something went wrong, try again in sometime...');
       return;
     }
     url.value=imageList.first;
      status.value=Status.completed;
    }else{
      MyDialog.info('Provide some beautiful image description!');
    }
  }
}