class Hadith {
  final String arabicText;
  final String englishText;

  Hadith({required this.arabicText, required this.englishText});

  factory Hadith.fromJson(Map<String, dynamic> json) {
    return Hadith(
      arabicText: json['hadith_ar'] as String,
      englishText: json['hadith_en'] as String,
    );
  }
}
