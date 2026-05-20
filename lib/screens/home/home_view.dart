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
        title: const Text(
          'KERIPIKROLL',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: controller.animes.length,
          itemBuilder: (context, index) {
            final anime = controller.animes[index];
            return GestureDetector(
              onTap: () => Get.toNamed(Routes.detail, arguments: anime.id),
              child: Card(
                color: const Color(0xFF151515),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Poster Image
                    Expanded(
                      flex: 3,
                      child: anime.posterImage.isNotEmpty
                          ? Image.network(
                              anime.posterImage,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (ctx, err, st) => Container(
                                color: Colors.grey.shade300,
                                child: const Icon(Icons.broken_image),
                              ),
                            )
                          : Container(
                              color: Colors.grey.shade300,
                              child: const Icon(Icons.image),
                            ),
                    ),
                    // Info di bawah poster
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Nama Anime
                            Text(
                              anime.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            // Rating Umur & Episode
                            Text(
                              '${anime.ageRating} • ${anime.episodeCount} Episodes',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey.shade600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            // Rating bintang
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.blueAccent,
                                  size: 14,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  anime.rating,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
