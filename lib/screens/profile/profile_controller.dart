import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../services/auth_service.dart';
import '../../services/hive_service.dart';

class ProfileController extends GetxController {
  var username = ''.obs;
  var favCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void loadUser() async {
    username.value = await AuthService.getUsername() ?? 'Guest';
    favCount.value = HiveService.countFavorites(username.value);
  }

  void logout() async {
    await AuthService.logout();
    Get.offAllNamed(Routes.login);
  }
}
