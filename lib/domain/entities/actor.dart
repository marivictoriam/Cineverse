class Actor {
  final int id;
  final String name;
  final String profilePath;
  final String? character;
  final String? biography;

  Actor(
      {required this.id,
      required this.name,
      required this.profilePath,
      this.character,
      this.biography});
}
