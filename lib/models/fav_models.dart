import 'package:hive/hive.dart';

part 'fav_models.g.dart';  // ← file ini di-generate otomatis

@HiveType(typeId: 0)  // ← angka unik, kalau ada model lain pakai 1, 2, dst
class FavModels extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String titles;

  @HiveField(2)
  final double averageRating;

  @HiveField(3)
  final String coverImage;

  @HiveField(5)
  final String username;  // ← penting! buat filter cart per user

  FavModels({
    required this.id,
    required this.titles,
    required this.coverImage,
    required this.averageRating,
    required this.username,
  });
}
