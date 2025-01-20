class MovieCreditsResponse {
  MovieCreditsResponse({
    required this.id,
    required this.cast,
  });

  final int id;
  final List<MovieCast> cast;

  factory MovieCreditsResponse.fromJson(Map<String, dynamic> json) =>
      MovieCreditsResponse(
        id: json["id"],
        cast: List<MovieCast>.from(
            json["cast"].map((x) => MovieCast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
      };
}

class MovieCast {
  MovieCast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    required this.creditId,
    this.order,
    this.department,
    this.job,
  });

  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String creditId;
  final int? order;
  final String? department;
  final String? job;

  factory MovieCast.fromJson(Map<String, dynamic> json) => MovieCast(
        adult: json["adult"] ?? false,
        gender: json["gender"] ?? 0,
        id: json["id"],
        knownForDepartment: json["known_for_department"]! ?? "",
        name: json["name"] ?? "",
        originalName: json["original_name"] ?? "",
        popularity: json["popularity"]?.toDouble() ?? 0.0,
        profilePath: json["profile_path"],
        castId: json["cast_id"],
        character: json["character"],
        creditId: json["credit_id"],
        order: json["order"],
        department: json["department"],
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "cast_id": castId,
        "character": character,
        "credit_id": creditId,
        "order": order,
        "department": department,
        "job": job,
      };
}
