import 'package:get/get.dart';
import '../../models/anime_models.dart';
import '../../services/api_service.dart';
import '../../services/auth_service.dart';

class HomeController extends GetxController {
  var animes = <AnimeModel>[].obs;
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
      animes.value = await ApiService.fetchAnimes();
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}