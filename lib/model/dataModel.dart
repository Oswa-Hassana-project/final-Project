import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TimeAzanModel {
  final String Fajr;
  final String Dhuhr;
  final String Asr;
  final String Maghrib;
  final String Isha;
  final String date;
  final String month;
  final String monthAr;

  TimeAzanModel(
      {required this.Fajr,
      required this.Dhuhr,
      required this.Asr,
      required this.Maghrib,
      required this.Isha,
      required this.date,
      required this.month,
      required this.monthAr});

  // static TimeAzanModel fromJson(Map<String, dynamic> json) {
  //   final data = json['data']['timings'] as Map<String, dynamic>;
  //   return TimeAzanModel(
  //     Fajr: data['Fajr'] as String,
  //     Dhuhr: data['Dhuhr'] as String,
  //     Asr: data['Asr'] as String,
  //     Maghrib: data['Maghrib'] as String,
  //     Isha: data['Isha'] as String,
  //   );
  // }

  // factory TimeAzanModel.fromJson(Map<String, dynamic> json){
  //   return TimeAzanModel(Fajr: json['timings']['Fajr'],
  //       Dhuhr: json['timings']['Dhuhr'],
  //       Asr: json['timings']['Asr'],
  //       Maghrib: json['timings']['Maghrib'],
  //       Isha: json['timings']['Isha']);
  // }
}
