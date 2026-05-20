import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_controller.dart';

class DetailView extends StatelessWidget {
  DetailView({super.key});

  final DetailController controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final anime = controller.anime.value;
        if (anime == null) {
          return const Center(child: Text('Data anime tidak ditemukan'));
        }

        return CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 240,
              pinned: true,
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  anime.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                background: anime.coverImage.isNotEmpty
                    ? Image.network(
                        anime.coverImage,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey.shade300,
                          child: const Icon(Icons.broken_image, size: 60),
                        ),
                      )
                    : Container(
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.image, size: 60),
                      ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.blueAccent),
                        const SizedBox(width: 6),
                        Text(
                          anime.rating,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${anime.ageRating} - ${anime.episodeCount} Episode',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Sinopsis',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      anime.synopsis.isEmpty
                          ? 'Sinopsis belum tersedia.'
                          : anime.synopsis,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.play_arrow),
                            label: const Text('Nonton'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                              minimumSize: const Size.fromHeight(48),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Obx(
                          () => IconButton.filled(
                            onPressed: controller.toggleFavorite,
                            style: IconButton.styleFrom(
                              backgroundColor: controller.isFavorite.value
                                  ? Colors.blueAccent
                                  : Colors.grey.shade700,
                              foregroundColor: Colors.white,
                              minimumSize: const Size(48, 48),
                            ),
                            icon: Icon(
                              controller.isFavorite.value
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
