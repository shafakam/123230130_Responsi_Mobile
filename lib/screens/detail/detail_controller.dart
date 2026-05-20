import 'package:get/get.dart';

import '../../models/anime_models.dart';
import '../../models/fav_models.dart';
import '../favorite/favorite_controller.dart';
import '../profile/profile_controller.dart';
import '../../services/api_service.dart';
import '../../services/auth_service.dart';
import '../../services/hive_service.dart';

class DetailController extends GetxController {
  var anime = Rxn<AnimeModel>();
  var isLoading = true.obs;
  var isFavorite = false.obs;
  String currentUser = '';

  @override
  void onInit() {
    super.onInit();
    String id = Get.arguments as String; // ID anime string!
    loadUser(id);
  }

  void loadUser(String id) async {
    currentUser = await AuthService.getUsername() ?? '';
    fetchDetail(id);
  }

  void fetchDetail(String id) async {
    isLoading.value = true;
    try {
      anime.value = await ApiService.fetchAnimeById(id);
      // Cek apakah sudah difavoritkan
      isFavorite.value = HiveService.isFavorite(id, currentUser);
    } catch (e) {
      Get.snackbar('Error', 'Gagal load: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void toggleFavorite() async {
    if (anime.value == null) return;
    if (isFavorite.value) {
      await HiveService.removeFavorite(anime.value!.id, currentUser);
      isFavorite.value = false;
      Get.snackbar('Info', 'Dihapus dari favorit');
    } else {
      final fav = FavoriteModel(
        id: anime.value!.id,
        title: anime.value!.title,
        rating: anime.value!.rating,
        posterImage: anime.value!.posterImage,
        username: currentUser,
      );
      await HiveService.addFavorite(fav);
      isFavorite.value = true;
      Get.snackbar('Sukses', 'Ditambahkan ke favorit!');
    }

    if (Get.isRegistered<FavoriteController>()) {
      Get.find<FavoriteController>().loadFavorites();
    }
    if (Get.isRegistered<ProfileController>()) {
      Get.find<ProfileController>().loadUser();
    }
  }
}
