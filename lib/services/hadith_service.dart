import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import '../models/hadith.dart';

class HadithService {
  List<Hadith>? _hadiths;

  Future<void> _loadHadiths() async {
    if (_hadiths == null) {
      final jsonString = await rootBundle.loadString('assets/hadiths.json');
      final List<dynamic> jsonList = jsonDecode(jsonString);
      _hadiths = jsonList.map((json) => Hadith.fromJson(json)).toList();
    }
  }

  Future<Hadith> fetchHadith() async {
    await _loadHadiths();
    if (_hadiths == null || _hadiths!.isEmpty) {
      throw Exception('Failed to load hadiths');
    }
    final randomIndex = Random().nextInt(_hadiths!.length);
    return _hadiths![randomIndex];
  }
}
