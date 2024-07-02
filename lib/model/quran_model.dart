class QuranModel {
  final int number;
  final String name;
  final String ayahs;
  final String englishName;
  final String englishNameTranslation;
  final String revelationType;
  final int ayahsNumber;
  final List<QuranItem> array_ayahs;

  QuranModel({
    required this.number,
    required this.name,
    required this.ayahs,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.array_ayahs,
    required this.ayahsNumber,
  });

  factory QuranModel.fromJson(Map<String, dynamic> json) {
    final ayahs = json['ayahs'] as List<dynamic>;

    return QuranModel(
      number: json['number'],
      name: json['name'],
      ayahs: ayahs.map((ayah) => ayah['text']).join('\n'),
      ayahsNumber:
          ayahs.map((ayah) => ayah['numberInSurah']).toList()[0],
      englishName: json['englishName'],
      englishNameTranslation: json['englishNameTranslation'],
      array_ayahs: ayahs.map((ayah) => QuranItem.fromJson(ayah)).toList(),
      revelationType: json['revelationType'],
    );
  }
}

class QuranItem {
  final String ayahs;
  final int ayahsNumber;

  QuranItem({
    required this.ayahs,
    required this.ayahsNumber,
  });

  factory QuranItem.fromJson(Map<String, dynamic> json) {
    return QuranItem(
      ayahs: json['text'],
      ayahsNumber: json['numberInSurah'],
    );
  }
}
