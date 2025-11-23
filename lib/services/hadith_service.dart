import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/hadith.dart';

class HadithService {
  static const String _url =
      'https://api.hadithhub.com/v1/hadiths/random/?language=en';

  Future<Hadith> fetchHadith() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      return Hadith.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load hadith');
    }
  }
}
