// import 'dart:developer';
//
// import 'package:dio/dio.dart';
// import 'package:project/models/quran_model.dart';
//
// class QuranService{
//   final Dio dio;
//   final String URL = "https://api.alquran.cloud/v1/quran/quran-uthmani";
//
//   QuranService(this.dio);
//
//   Future<QuranModel> getcurrentayah() async {
//     try {
//       Response response = await dio.get(URL);
//       QuranModel quranModel = QuranModel.fromJson(response.data);
//       return quranModel;
//     }catch(e){
//       log('WS1 ${e.toString()}');
//       throw Exception('oops there was an error , try later');
//     }
//     }
//   }
//
