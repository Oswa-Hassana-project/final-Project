import 'package:finalproject/model/dataModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TimeRepository {
  Future<List<TimeAzanModel>> getTime() async {
    const endpoint =
        'http://api.aladhan.com/v1/timingsByCity?city=Egyptian General Authority of Survey&country=Egypt&method=5';
    final uri = Uri.parse(endpoint);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final data = json['data'] as Map<String, dynamic>;
      final date = data['date'] as Map<String, dynamic>;
      final timings = data['timings'] as Map<String, dynamic>;
      final hijri = date['hijri'] as Map<String, dynamic>;
      final month = hijri['month'] as Map<String, dynamic>;

      final result = TimeAzanModel(
          Fajr: timings['Fajr'] as String,
          Dhuhr: timings['Dhuhr'] as String,
          Asr: timings['Asr'] as String,
          Maghrib: timings['Maghrib'] as String,
          Isha: timings['Isha'] as String,
          date: hijri['date'] as String,
          month: month['en'] as String,
          monthAr: month['ar'] as String);

      return [result];
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

// if (response.statusCode == 200) {
//       final json = (jsonDecode(response.body)) ;
//       final result = json.map((e) {
//         return TimeAzanModel(Fajr: e['data']['timings']['Fajr'],
//             Dhuhr: e['data']['timings']['Dhuhr'],
//             Asr: e['data']['timings']['Asr'],
//             Maghrib: e['data']['timings']['Maghrib'],
//             Isha: e['data']['timings']['Isha']);
//       });
//       return result;
//     }

// // final List result =jsonDecode(response.body)['data'];
// // return result.map(((e) => TimeAzanModel.fromJson(e))).toList();
// }

//     if (response.statusCode == 200) {
//       final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
//       final data = jsonBody['data'] as Map<String, dynamic>;
// // Extracting timings data
//       final timings = data['timings'] as Map<String, dynamic>;
// // Extracting individual prayer timings
//       final fajr = timings['Fajr'] as String;
//       final dhuhr = timings['Dhuhr'] as String;
//       final asr = timings['Asr'] as String;
//       final maghrib = timings['Maghrib'] as String;
//       final isha = timings['Isha'] as String;
// // Creating TimeAzanModel object
//       final result = [
//         TimeAzanModel(Fajr: fajr, Dhuhr: dhuhr, Asr: asr, Maghrib: maghrib, Isha: isha)
//       ];
//       return result;
//     }
