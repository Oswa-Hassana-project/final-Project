import 'dart:convert';
import 'package:finalproject/model/quran_model.dart';
import 'package:http/http.dart' as http;

class QuranRepository {
  Future<List<QuranModel>> getAll() async {
    const url = "https://api.alquran.cloud/v1/quran/quran-uthmani";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.statusCode);
    print(response.body);
    // print(response.body['data']);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final data = json['data'] as Map<String, dynamic>;
      final surahs = data['surahs'] as List<dynamic>;

      final results = surahs.map((surah) {
        final surahData = surah as Map<String, dynamic>;
        final ayahs = surahData['ayahs'] as List<dynamic>;

        return QuranModel(
          number: surahData['number'],
          name: surahData['name'],
          ayahs: ayahs.map((ayah) => ayah['text']).join('\n'),
          englishName: surahData['englishName'],
          englishNameTranslation: surahData['englishNameTranslation'],
          array_ayahs: ayahs.map((ayah) => QuranItem.fromJson(ayah)).toList(),
          revelationType: surahData['revelationType'],
          ayahsNumber: ayahs.length,
        );
      }).toList();

      return results;
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  }
}
