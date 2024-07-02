import 'dart:convert';

import 'package:finalproject/model/azkarModel.dart';
import 'package:flutter/services.dart';

class LoadAzkarData {
  Future<List<Azkar>> GetAzkData() async {
    try {
      final  jsonString = await rootBundle.loadString('assets/json/adhkar.json');
      final jsonData = jsonDecode(jsonString) as List;
      return jsonData.map((item) => Azkar.fromJson(item)).toList();

    } catch (e) {
      String Error=e.toString();
      print("Error loading JSON data: $Error");
      throw e.toString();
    }
  }



}

// List category = [];
// Future<void> readJson() async {
//   final String response = await rootBundle.loadString('assets/json/adhkar.json');
//   final data = await json.decode(response);
//   category = data["category"];
// }
