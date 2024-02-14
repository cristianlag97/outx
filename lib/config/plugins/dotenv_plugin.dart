import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotenvPlugin {
  static Future<void> initialize() async {
    await dotenv.load(fileName: ".env");
  }

  static String apiUrl =
      dotenv.env['API_URL'] ?? 'No está configurada el API_URL';

  // static String apiKey =
  //     dotenv.env['API_KEY_WEATHER'] ?? 'No está configurada el API_KEY_WEATHER';
}
