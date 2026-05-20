import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'favorite_controller.dart';
import '../../routes/app_routes.dart';

class FavoriteView extends StatelessWidget {
  FavoriteView({super.key});
  final FavoriteController controller = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Daftar Favorit',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        if (controller.favorites.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite_border, size: 80, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'Belum ada anime favorit',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) {
            final item = controller.favorites[index];
            return Card(
              color: const Color(0xFF151515),
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                onTap: () => Get.toNamed(Routes.detail, arguments: item.id),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: item.posterImage.isNotEmpty
                      ? Image.network(
                          item.posterImage,
                          width: 50,
                          height: 70,
                          fit: BoxFit.cover,
                          errorBuilder: (ctx, err, st) =>
                              const Icon(Icons.broken_image),
                        )
                      : const Icon(Icons.image, size: 50),
                ),
                title: Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.blueAccent, size: 14),
                    const SizedBox(width: 2),
                    Text(item.rating),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.blueAccent),
                  onPressed: () => controller.deleteItem(item.id),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
