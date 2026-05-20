import 'package:get/get.dart';
import '../../models/fav_models.dart';
import '../../services/hive_service.dart';
import '../../services/auth_service.dart';
import 'package:flutter/material.dart';

class FavoriteController extends GetxController {
  var favorites = <FavoriteModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void loadFavorites() async {
    String user = await AuthService.getUsername() ?? '';
    favorites.value = HiveService.getFavoritesByUsername(user);
  }

  void deleteItem(String animeId) async {
    String user = await AuthService.getUsername() ?? '';
    Get.defaultDialog(
      title: 'Hapus Favorit',
      middleText: 'Yakin ingin menghapus anime ini dari favorit?',
      textConfirm: 'Ya, Hapus',
      textCancel: 'Batal',
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () async {
        await HiveService.removeFavorite(animeId, user);
        Get.back();
        loadFavorites();
        Get.snackbar('Berhasil', 'Anime dihapus dari favorit');
      },
    );
  }
}