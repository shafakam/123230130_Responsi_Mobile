import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/anime_models.dart'
;

class ApiService {
  static const String baseUrl = 'https://kitsu.io/api/edge/anime/?page[limit]=20&page[offset]=0';
  
  static Future<List<AnimeModel>> fetchAnimes() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/items'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> list = data['items']; // ← sesuaikan key-nya!
        return list.map((json) => AnimeModel.fromJson(json)).toList();
      }
      throw Exception('Gagal fetch');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Untuk Detail — TAMBAHAN INI
  static Future<AnimeModel> fetchAnimeById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/items/$id'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return AnimeModel.fromJson(data); // ← langsung parse, bukan list
      }
      throw Exception('Gagal fetch detail');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

