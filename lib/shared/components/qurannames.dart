import 'package:flutter/material.dart';

import '../styles/response.dart';
import '../styles/standers.dart';

class quranName extends StatelessWidget {
  final String surahname;
  final String surahnameenglish;
  final String surahnameenglishtranslation;
  final String ayahsNumber;
  const quranName({
    super.key,
    required this.surahname,
    required this.surahnameenglish,
    required this.surahnameenglishtranslation,
    required this.ayahsNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 37.9,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$surahnameenglish",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: maincolor,
                      fontFamily: 'assets/fonts/Poppins',
                    ),
                  ),
                  Text(
                    "verse ${ayahsNumber}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: maincolor,
                    ),
                  ),
                  Text(
                    "(${surahnameenglishtranslation})",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: maincolor,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                overflow:TextOverflow.ellipsis ,
                maxLines: 1,
                "$surahname",
                // overflow: TextOverflow.visible,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: maincolor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: maincolor,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}

