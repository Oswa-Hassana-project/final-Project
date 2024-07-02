import 'package:finalproject/widgets/constsnts.dart';
import 'package:flutter/material.dart';

class NeuCircle extends StatelessWidget {
  final child;
  const NeuCircle({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/background.jpg"),
                  fit: BoxFit.fill)),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          margin: EdgeInsets.all(40),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.brown[600],
            boxShadow: [
              BoxShadow(
                  color: Colors.green.shade800,
                  offset: Offset(4.0, 4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: Colors.white70,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white54,
                Colors.white60,
                Colors.white70,
                Colors.white30,
              ],
              stops: [0.1, 0.3, 0.8, 1],
            ),
          ),
          child: child,
        ),
        Container(
          height: heightR(100, context),
          width: widthR(393, context),
          decoration: BoxDecoration(color: Colors.transparent,borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          child: Padding(
            padding:  EdgeInsets.only(top: heightR(49.2, context),left: widthR(20, context),right:widthR(20, context) ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                  Text("القبله",style: TextStyle(color: Colors.white,fontSize: sizeR(24, context),fontWeight: FontWeight.w700),),
                  SizedBox(width: 15,),
                ]),
          ),
        ) ,

      ],
    );
  }
}
