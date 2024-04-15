







class Movie {
  final String id, name, language, year, rating;

  Movie({
    required this.year,
    required this.id,
    required this.name,
    required this.language,
    required this.rating,
  });

  factory Movie.fromJson(String id, Map<String, dynamic> json) {
    return Movie(
        year: json["year"],
        id: id,
        name: json["name"],
        language: json["language"],
        rating: json["rating "] ?? "NA");
  }
}
