import 'package:flutter/material.dart';

import '../main.dart';
class CustomeBtn extends StatelessWidget{
  final VoidCallback onTap;
  final  text;

  const CustomeBtn({super.key, required this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    mq=MediaQuery.of(context).size;
    return Align(
      child: ElevatedButton(onPressed: onTap,
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: Theme.of(context).btnColor,
            elevation: 0,
            textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
            minimumSize: Size(mq.width*0.4,50)
        ), child: Text(text,style: const TextStyle(color: Colors.white),)
        ,
      ),
    );
  }
}