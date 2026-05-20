import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsi/screens/favorite/favorite_view.dart';
import 'package:responsi/screens/home/home_view.dart';
import 'package:responsi/screens/profile/profile_view.dart';
import 'main_controller.dart';

class MainView extends StatelessWidget {
  MainView({super.key});
  final MainController controller = Get.put(MainController());
  final List<Widget> pages = [HomeView(), FavoriteView(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorit',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ],
        ),
      ),
    );
  }
}
