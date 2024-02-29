import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/translate_controller.dart';
class LanguageSheet extends StatefulWidget{
  final TranslateController trx;
  final RxString s;

  const LanguageSheet({super.key, required this.trx, required this.s});

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  final _search=''.obs;
  @override
  Widget build(BuildContext context) {
    final hei=MediaQuery.of(context).size.height;
    final wid=MediaQuery.of(context).size.width;
     return Container(
       padding: EdgeInsets.only(left: wid*0.04,right: wid*0.04,top: hei*0.02),
       height: hei*0.5,
       decoration: BoxDecoration(
         color: Theme.of(context).scaffoldBackgroundColor,
         borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
       ),
       child: Column(
         children: [
           TextFormField(
             onChanged: (s)=>_search.value=s.toLowerCase(),
             decoration: const InputDecoration(
               prefixIcon: Icon(Icons.translate_rounded,color: Colors.blue,),
                 hintText: 'Search Language...',
                 hintStyle: TextStyle(fontSize: 14),
                 border: OutlineInputBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10))
                 )
             ),
             onTapOutside: (e)=> FocusScope.of(context).unfocus(),
           ),
           Expanded(
             child: Obx(
              (){
                final List<String> list=_search.isEmpty?widget.trx.lang:widget.trx.lang.where((element) => element.toLowerCase().contains(_search.value)).toList();
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                 padding: EdgeInsets.only(top: hei*0.02,left: 4),
                 itemCount: list.length,
                   itemBuilder: (context,index){
                   return InkWell(
                     onTap: (){
                      widget.s.value=list[index];
                      Get.back();
                     },
                     child: Padding(
                       padding: EdgeInsets.only(bottom: hei*0.02),
                       child: Text(list[index]),
                     ),
                   );
               });
             }
             ),
           )
         ],
       ),
     );
  }
}