// lib/screens/home/home_controller.dart

import 'package:get/get.dart';
import '../../models/anime_models.dart';
import '../../services/api_service.dart';
import '../../services/auth_service.dart';

class HomeController extends GetxController {
  // Variabel reaktif
  var products = <AnimeModel>[].obs;
  var isLoading = true.obs;
  var username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    isLoading.value = true;
    username.value = await AuthService.getUsername() ?? 'Guest';
    
    try {
      products.value = await ApiService.fetchAnimes();
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat anime: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
