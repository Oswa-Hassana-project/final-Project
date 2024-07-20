import 'package:flutter/material.dart';

import '../shared/styles/response.dart';

class Promocodes extends StatelessWidget {
  const Promocodes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: heightR(100, context),
            width: widthR(393, context),
            decoration: BoxDecoration(
                color: Color(0xFF16A896),
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(30))),
            child: Padding(
              padding: EdgeInsets.only(
                  top: heightR(49.2, context),
                  left: widthR(20, context),
                  right: widthR(20, context)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    Text(
                      "promocodes",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: sizeR(24, context),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ]),
            ),
          ),
          Center(
            child: Text(
              'No promoCodes Are Available'
            ),
          ),
        ],
      ),
    );
  }
}
