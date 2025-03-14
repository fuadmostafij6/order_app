import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:create_order_app/core/constants/api/api.dart';

class ApiClient {
  final String baseUrl;

  ApiClient({required this.baseUrl});

  Future<http.Response> get(String endpoint,
      {Map<String, String>? headers}) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final response = await http.get(uri, headers: headers);
      _handleResponse(response);
      return response;
    } catch (e) {
      throw Exception("GET request failed: $e");
    }
  }

  Future<http.Response> post(String endpoint,
      {String? token, dynamic body}) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final response = await http.post(
        uri,
        headers: { 'Accept': 'application/json',
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );
      _handleResponse(response);
      return response;
    } catch (e) {
      throw Exception("POST request failed: $e");
    }
  }

  Future<http.Response> put(String endpoint,
      {String? token, dynamic body}) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final response = await http.put(
        uri,
        headers: {'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );
      _handleResponse(response);
      return response;
    } catch (e) {
      throw Exception("PUT request failed: $e");
    }
  }

  Future<http.Response> delete(String endpoint, {String? token}) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final response = await http.delete(
        uri, headers: {'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },);
      _handleResponse(response);
      return response;
    } catch (e) {
      throw Exception("DELETE request failed: $e");
    }
  }

  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' ' with status code : ${response.statusCode}');
    }
  }
}
