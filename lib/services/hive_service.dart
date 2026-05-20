import 'package:hive_flutter/hive_flutter.dart';
import '../models/fav_models.dart';

class HiveService {
  static final Box<FavModels> _favBox = Hive.box<FavModels>('favBox');

  // Tambah item ke favorit
  static Future<void> addToFav(FavModels item) async {
    await _favBox.add(item);
  }

  // Ambil favorit milik username tertentu
  static List<FavModels> getFavsByUsername(String username) {
    return _favBox.values.where((item) => item.username == username).toList();
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
