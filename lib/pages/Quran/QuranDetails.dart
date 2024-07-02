import 'package:flutter/material.dart';

import '../../model/quran_model.dart';
import '../../shared/styles/response.dart';
import '../../shared/styles/standers.dart';


class QuranDetailsPage extends StatefulWidget {
  final QuranModel quran;
  final String surahname;
  final String surahtype;

  const QuranDetailsPage({
    super.key,
    required this.quran,
    required this.surahtype,
    required this.surahname,
  });

  @override
  State<QuranDetailsPage> createState() => _QuranDetailsPageState();
}

class _QuranDetailsPageState extends State<QuranDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: heightR(179, context),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: maincolor,
                        borderRadius: BorderRadius.circular(30)),
                    width: widthR(343, context),
                    height: heightR(47, context),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            widget.surahname,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "verse  ,${widget.quran.ayahsNumber} ",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            widget.surahtype,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: ListView.builder(
                      itemCount: widget.quran.array_ayahs.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        // Concatenate Ayah text and Ayah number
                        final ayahTextWithNumber =
                            "${widget.quran.array_ayahs[index].ayahs} (${widget.quran.array_ayahs[index].ayahsNumber})";

                        return SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        ayahTextWithNumber,
                                        textAlign: TextAlign.justify,
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                      "Qur'an",
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
        ],
      ),
    );
  }
}
