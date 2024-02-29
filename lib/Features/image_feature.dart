import 'package:ai_bot/Controller/image_controller.dart';
import 'package:ai_bot/Widgets/custom_btn.dart';
import 'package:ai_bot/Widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:cached_network_image/cached_network_image.dart';
class ImageFeature extends StatefulWidget{
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  final _imgController=ImageController();
  @override
  Widget build(BuildContext context) {
    final hei=MediaQuery.of(context).size.height;
    final wid=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Image Assistant'),
        actions: [
          Obx(
          ()=> _imgController.status.value==Status.completed?IconButton(
              padding: const EdgeInsets.only(right: 6),
                onPressed: _imgController.shareImage, icon: const Icon(Icons.share)):const SizedBox(),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: hei*0.02,bottom: hei*0.1,left: wid*0.04,right: wid*0.04),
        children: [
          TextFormField(
            controller: _imgController.Ctr,
            minLines: 2,
            maxLines: null,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
                hintText: 'Imagine something wonderfull & innovative\nType here and I will create for you 🙂',
                hintStyle: TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                )
            ),
            onTapOutside: (e)=> FocusScope.of(context).unfocus(),
          ),
          Container(
            height: hei*0.5,
              margin: EdgeInsets.symmetric(vertical: hei* .003),
              alignment: Alignment.center,
              child: Obx(()=>_aiImage())),
          Obx(() => _imgController.imageList.isEmpty?const SizedBox():SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Wrap(
                spacing: 10,
                children:
                _imgController.imageList.map((e) => InkWell(
                  onTap: (){
                    _imgController.url.value=e;
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: CachedNetworkImage(
                      imageUrl: e,
                      height: 100,
                      errorWidget: (context, url, error) => const SizedBox(),
                    ),
                  ),
                ),).toList()
            ),
          )),
          SizedBox(
            height: hei*0.01,
          ),
          CustomeBtn(onTap:
          _imgController.searchAiImages
            ,text: 'Create',),
        ],
      ),
      floatingActionButton: Obx(()=> _imgController.status.value==Status.completed?Padding(
        padding: const EdgeInsets.only(right: 6.0,bottom: 6.0),
        child: FloatingActionButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          onPressed: _imgController.downloadImage,
          child: const Icon(Icons.save_alt_outlined,size: 26,),
        ),
      ):const SizedBox()
    ));
  }
  Widget _aiImage() => ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    child: switch (_imgController.status.value) {
      Status.none =>
          Lottie.asset('assets/lottie/ai_play.json', height: MediaQuery.of(context).size.height * .3),
      Status.completed => CachedNetworkImage(
        imageUrl: _imgController.url.value,
        placeholder: (context, url) => CustomLoading(),
        errorWidget: (context, url, error) => const SizedBox(),
      ),
      Status.loading => CustomLoading()
    },
  );
}