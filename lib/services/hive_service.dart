import 'package:hive_flutter/hive_flutter.dart';
import '../models/fav_models.dart';

class HiveService {
  static final Box<FavoriteModel> _favBox = Hive.box<FavoriteModel>('favBox');

  // Tambah item ke favorit
  static Future<void> addToFav(FavoriteModel item) async {
    await _favBox.add(item);
  }

  static Future<void> addFavorite(FavoriteModel item) async {
    await addToFav(item);
  }

  // Ambil favorit milik username tertentu
  static List<FavoriteModel> getFavsByUsername(String username) {
    return _favBox.values.where((item) => item.username == username).toList();
  }

  static List<FavoriteModel> getFavoritesByUsername(String username) {
    return getFavsByUsername(username);
  }

  static bool isFavorite(String animeId, String username) {
    return _favBox.values.any(
      (item) => item.id == animeId && item.username == username,
    );
  }

  static int countFavorites(String username) {
    return getFavsByUsername(username).length;
  }

  static Future<void> removeFavorite(String animeId, String username) async {
    final keys = _favBox.keys.toList();
    final values = _favBox.values.toList();

    for (int i = 0; i < values.length; i++) {
      if (values[i].id == animeId && values[i].username == username) {
        await _favBox.delete(keys[i]);
        return;
      }
    }
  }

  // Hapus item dari favorit berdasarkan key Hive
  static Future<void> deleteFavItem(int hiveKey) async {
    await _favBox.delete(hiveKey);
  }

  // Ambil key Hive milik username tertentu (untuk delete)
  static List<dynamic> getFavKeysByUsername(String username) {
    final keys = _favBox.keys.toList();
    final values = _favBox.values.toList();
    List<dynamic> userKeys = [];
    for (int i = 0; i < values.length; i++) {
      if (values[i].username == username) {
        userKeys.add(keys[i]);
      }
    }
    return userKeys;
  }
}
