class Azkar {
  final int id;
  final String category;
  final String audio;
  final String filename;
  final List<AzkarItem> array;
  bool isBookmarked; // Add this property


  Azkar({required this.id,required this.category,required this.audio,required this.filename,required this.array,required this.isBookmarked});

  factory Azkar.fromJson(Map<String, dynamic> json) {
    return Azkar(
      id: json['id'],
      category: json['category'],
      audio: json['audio'],
      filename: json['filename'],
      array: (json['array'] as List).map((item) => AzkarItem.fromJson(item)).toList(),
      isBookmarked: json['isBookmarked'] ?? false,
    );
  }
}

class AzkarItem {
  final int id;
  final String text;
  final int count;
  final String audio;
  final String filename;

  AzkarItem({required this.id, required this.text,required this.count,required this.audio,required this.filename, required bool isBookmarked});

  factory AzkarItem.fromJson(Map<String, dynamic> json) {
    return AzkarItem(
      id: json['id'],
      text: json['text'],
      count: json['count'],
      audio: json['audio'],
      filename: json['filename'],
      isBookmarked:false,
    );
  }
}
