import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String tmdbApiKey = dotenv.env['TMDB_API_KEY'] ?? 'No hay API key';
}
