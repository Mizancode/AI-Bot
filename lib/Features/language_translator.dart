import 'package:ai_bot/Controller/translate_controller.dart';
import 'package:ai_bot/Widgets/custom_btn.dart';
import 'package:ai_bot/Widgets/language_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../Controller/image_controller.dart';
import '../Widgets/custom_loading.dart';
class LanguageFeature extends StatefulWidget{
  const LanguageFeature({super.key});

  @override
  State<LanguageFeature> createState() => _LanguageFeatureState();
}

class _LanguageFeatureState extends State<LanguageFeature> {
  final _translateController=TranslateController();
  @override
  Widget build(BuildContext context) {
    final hei=MediaQuery.of(context).size.height;
    final wid=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Translator'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: hei*0.02,bottom: hei*0.1),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: ()=>Get.bottomSheet(LanguageSheet(trx: _translateController,s: _translateController.from,)),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: 50,
                  width: wid*0.4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: const BorderRadius.all(Radius.circular(15))
                  ),
                  child: Obx(()=>Text(_translateController.from.isEmpty?'Auto': _translateController.from.value)),
                ),
              ),
              IconButton(onPressed: _translateController.swapLanguage
                  , icon: Obx(()=>Icon(CupertinoIcons.repeat,color: _translateController.to.isNotEmpty && _translateController.from.isNotEmpty? Colors.blue : Colors.grey,))),
              InkWell(
                onTap: ()=>Get.bottomSheet(LanguageSheet(trx: _translateController,s: _translateController.to,)),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: 50,
                  width: wid*0.4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: const BorderRadius.all(Radius.circular(15))
                  ),
                  child: Obx(()=>Text(_translateController.to.isEmpty?'To': _translateController.to.value)),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: wid*0.04,vertical: hei*0.035),
            child: TextFormField(
              controller: _translateController.textC,
              minLines: 5,
              maxLines: null,
              decoration: const InputDecoration(
                  hintText: 'Translate anything you want...',
                  hintStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  )
              ),
              onTapOutside: (e)=> FocusScope.of(context).unfocus(),
            ),
          ),
          Obx(()=>translateResult()
          ),
          SizedBox(height: hei*0.02,),
          CustomeBtn(onTap: _translateController.translate,text: 'Translate',)
        ],
      ),
    );
  }
  Widget translateResult() => switch (_translateController.status.value) {
    Status.none => const SizedBox(),
    Status.completed => Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.04),
      child: TextFormField(
        controller: _translateController.resultC,
        maxLines: null,
        decoration: const InputDecoration(
            hintStyle: TextStyle(fontSize: 14),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
            )
        ),
        onTapOutside: (e)=> FocusScope.of(context).unfocus(),
      ),
    ),
    Status.loading => Align(child: CustomLoading())
  };
}