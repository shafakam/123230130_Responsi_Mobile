import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import '../../routes/app_routes.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('Hi, ${controller.username.value}')),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
          ),
          itemCount: controller.products.length,
          itemBuilder: (ctx, i) {
            final p = controller.products[i];
            return Card(
              child: Column(
                children: [
                  Image.network(p.coverImage, height: 120, fit: BoxFit.cover),
                  Text(p.titles),
                  Text('\$${p.ageRating}.\$${p.episodeCount}'),
                  Text('\$${p.averageRating}')
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
