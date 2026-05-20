class AnimeModel{
  final int id;
  final String titles;
  final String ageRating;
  final String averageRating;
  final int episodeCount;
  final String coverImage;

  AnimeModel({
    required this.id,
    required this.titles,
    required this.ageRating,
    required this.averageRating,
    required this.episodeCount,
    required this.coverImage,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      id: json['id'] ?? 0,
      titles: json['titles'] ?? 'No Title',
      ageRating: json['ageRating'] ?? 'No Age Rating',
      averageRating: json['averageRating'] ?? 'No Average Rating',
      episodeCount: json['episodeCount'] ?? 0,
      coverImage: json['coverImage'] ?? 'No Cover Image',
    );
  }

}


    
  


