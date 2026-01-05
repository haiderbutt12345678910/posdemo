import 'dart:convert';
import 'package:dio/dio.dart';
import '../errors/exception.dart';
import 'token_service.dart';

/// Handles all API calls.
///
/// PURPOSE:
/// - Centralizes API logic
/// - Adds auth headers automatically
/// - Converts Dio errors into clean Exceptions
/// - Parses JSON responses
class ApiService {
  final Dio _dio;
  final TokenService _tokenService;

  ApiService(this._dio, this._tokenService) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = _tokenService.token;
          if (token != null) options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
      ),
    );
  }

  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParams);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> post(String path, {dynamic data,}) async {
    try {
      final response = await _dio.post(path, data: data);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Map<String, dynamic> _handleResponse(Response response) {
    if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
      if (response.data is Map<String, dynamic>) return response.data;
      if (response.data is String) return jsonDecode(response.data);
      return {};
    } else {
      throw ServerException("Server error: ${response.statusCode}");
    }
  }

  Exception _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout) {
      return NetworkException("Connection timeout");
    } else if (e.type == DioExceptionType.badResponse) {
      return ServerException("Server returned error: ${e.response?.statusCode}");
    } else if (e.type == DioExceptionType.unknown) {
      return NetworkException("No internet connection");
    } else {
      return ServerException(e.message as String);
    }
  }
}
