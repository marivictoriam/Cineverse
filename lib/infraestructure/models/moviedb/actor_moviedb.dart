class ActorMovieDb {
  bool adult;
  int gender;
  int id;
  String name;
  String originalName;
  double popularity;
  String? profilePath;

  ActorMovieDb({
    required this.adult,
    required this.gender,
    required this.id,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
  });

  factory ActorMovieDb.fromJson(Map<String, dynamic> json) => ActorMovieDb(
        adult: json["adult"] ?? false,
        gender: json["gender"] ?? 0,
        id: json["id"],
        name: json["name"] ?? "...",
        originalName: json["original_name"] ?? "...",
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
      };
}
