import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/qurannames.dart';
import '../../shared/cubit/quran_cubit.dart';
import '../../shared/cubit/quran_state.dart';
import '../../shared/styles/response.dart';
import 'QuranDetails.dart';

class Quransurahs extends StatefulWidget {
  const Quransurahs({super.key});

  @override
  State<Quransurahs> createState() => _QuransurahsState();
}

class _QuransurahsState extends State<Quransurahs> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<QuranCubit>();
      cubit.fetchQuran();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<QuranCubit, quranState>(
        builder: (context, state) {
          if (state is InitQuranState || state is LoadingQuranState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ResponseQuranState) {
            final qurans = state.qurans;
            // final qurans_en = state.qurans_en;
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: heightR(137, context),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF13a795),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          width: widthR(296, context),
                          height: heightR(128, context),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.menu_book,
                                            size: 25,
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          Text(
                                            "Last Read",
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        'Al-Fatiha',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      //ayahs no
                                      Text(
                                        'Ayah no.1',
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.book,
                                    size: 100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: qurans.length,
                            itemBuilder: (context, index) {
                              final quran = qurans[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => QuranDetailsPage(
                                          quran: quran,
                                          surahtype: quran.revelationType,
                                          surahname: quran.englishName,

                                          // quran_en: quran,
                                        ),
                                      ));
                                },
                                child: Container(
                                  child: quranName(
                                    surahname: quran.name,
                                    surahnameenglishtranslation:
                                        quran.englishNameTranslation,
                                    surahnameenglish: quran.englishName,
                                    ayahsNumber: quran.ayahsNumber.toString(),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: heightR(120, context),
                  width: widthR(393, context),
                  decoration: BoxDecoration(
                      color: Color(0xFF16A896),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      )),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: heightR(49.2, context),
                        left: widthR(20, context),
                        right: widthR(20, context)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(Icons.arrow_back_ios_outlined)),
                          Text(
                            "Qur'an",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: sizeR(24, context),
                                fontWeight: FontWeight.w700),
                          ),
                          Icon(Icons.search),
                        ]),
                  ),
                )
              ],
            );
          }
          return Center(
            child: Text(
              state.toString(),
            ),
          );
        },
      ),
    );
  }
}
