import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/anime_models.dart';

class ApiService {
  static const String baseUrl = 'https://kitsu.io/api/edge/anime';

  // Fetch semua anime untuk Home
  static Future<List<AnimeModel>> fetchAnimes() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl?page[limit]=20&page[offset]=0'),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> list = data['data'];
        return list.map((json) => AnimeModel.fromJson(json)).toList();
      }
      throw Exception('Gagal fetch');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  // Fetch detail anime by ID
  static Future<AnimeModel> fetchAnimeById(String id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return AnimeModel.fromJson(data['data']); // ← wrap di 'data'
      }
      throw Exception('Gagal fetch detail');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}