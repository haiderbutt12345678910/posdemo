import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkConfig {
  // Base URL (loaded from .env)
  static final String baseUrl = dotenv.env['BASE_URL'] ?? "https://fallback.url/api";

  // Endpoints
  static String login() => "$baseUrl/user/login";
  static String posMain() => "$baseUrl/pos/pos-main";
  static String productsByCategory(int categoryId, int page) =>
      "$baseUrl/pos/products_by_category?id=$categoryId&page=$page";

  // Default headers
  static Map<String, String> get headers => {
        "Content-Type": "application/json",
        // Auth token will be injected in ApiService
      };
}
