class AnimeModel {
  final String id;
  final String title;
  final String ageRating;
  final String episodeCount;
  final String rating;
  final String synopsis;
  final String posterImage;
  final String coverImage;

  AnimeModel({
    required this.id,
    required this.title,
    required this.ageRating,
    required this.episodeCount,
    required this.rating,
    required this.synopsis,
    required this.posterImage,
    required this.coverImage,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    final attr = json['attributes'] ?? {};
    final titles = attr['titles'] ?? {};
    final poster = attr['posterImage'] ?? {};
    final cover = attr['coverImage'] ?? {};

    return AnimeModel(
      id: json['id'] ?? '0',
      title: titles['en_jp'] ?? attr['canonicalTitle'] ?? 'No Title',
      ageRating: attr['ageRating'] ?? 'N/A',
      episodeCount: attr['episodeCount']?.toString() ?? 'N/A',
      rating: attr['averageRating'] ?? '0',
      synopsis: attr['synopsis'] ?? '',
      posterImage: poster['small'] ?? '',
      coverImage: cover['large'] ?? poster['large'] ?? '',
    );
  }
}