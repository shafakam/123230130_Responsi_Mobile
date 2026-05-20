
import 'package:get/get.dart';
import 'package:responsi/screens/favorite/favorite_view.dart';
import 'package:responsi/screens/detail/detail_view.dart';
import 'package:responsi/screens/login/login_view.dart';
import 'package:responsi/screens/main/main_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.login, page: () => LoginView()),
    GetPage(name: Routes.main, page: () => MainView()),
    // GetPage(name: Routes.detail, page: () => DetailView()),
    // GetPage(name: Routes.cart, page: () => CartView()),

  ];
}
