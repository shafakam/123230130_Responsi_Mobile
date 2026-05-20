import 'package:hive/hive.dart';
part 'fav_models.g.dart';

@HiveType(typeId: 0)
class FavoriteModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String rating;

  @HiveField(3)
  final String posterImage;

  @HiveField(4)
  final String username;

  FavoriteModel({
    required this.id,
    required this.title,
    required this.rating,
    required this.posterImage,
    required this.username,
  });
}