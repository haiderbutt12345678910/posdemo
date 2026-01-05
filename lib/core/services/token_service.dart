// ignore: dangling_library_doc_comments
/// Manages auth token in memory for this demo.


/// - Decouples token storage from UI & API layers
/// - Simplifies login flow
/// - Makes token replacement easy for future secure storage
class TokenService {
  String? _token;

  void saveToken(String token) => _token = token;
  String? get token => _token;
  void clear() => _token = null;
}
