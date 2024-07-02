import 'dart:ffi';

import 'package:finalproject/shared/cubit/azkarCubit.dart';
import 'package:finalproject/widgets/constsnts.dart';
import 'package:flutter/material.dart';

Widget Prayer_times (Prayer,image,time){
  return Column(
    children: [
      Text(Prayer,style: TextStyle(fontSize: 15,color: Colors.white),),
      SizedBox(height: 8,),
      Image(image: AssetImage(image),height: 24.1,width: 25),
      SizedBox(height: 8,),
      Text(time,style: TextStyle(fontSize: 10,color: Colors.white),)
    ],

  );
}

Widget features (icon,name,newRoute,context){

  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => newRoute ,));
      },
    child: Column(
      children: [
        Image(image: AssetImage(icon),width: 42,height: 42,),
        SizedBox(height: 5,),
        Text(name,style: TextStyle(fontSize: 11, color: Colors.black ),)
      ],
    ),
  );
}

Widget AzkarWidget(String title,int index,isBook,context,{required  VoidCallback onBookmarkToggle}){
  AzkarCubit cubit = AzkarCubit.get(context);

  return  Padding(
    padding:  EdgeInsets.only(top: heightR(16, context)),
    child: Container(
      width: widthR(362, context),
      height: heightR(60, context),
      decoration: BoxDecoration(
        color: Color(0xFFc7e7e3),
        borderRadius:
        BorderRadius.circular(sizeR(23, context)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          IconButton(
            onPressed: onBookmarkToggle,
            icon: Icon( isBook
                ? Icons.bookmark
                : Icons.bookmark_border,),
            iconSize: sizeR(35, context),
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: sizeR(18, context),fontWeight: FontWeight.w700 ),
              textDirection: TextDirection.rtl,
            ),
          ),

          Image(
            image: AssetImage(
              'assets/icons/Rectangle 998.png',
            ),
          ),
        ],
      ),
    ),
  );
}

