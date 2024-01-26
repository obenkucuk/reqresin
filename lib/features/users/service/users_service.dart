import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:reqres_in_api_example/constants/http_urls.dart';

class UsersService {
  const UsersService();

  Future<http.Response> loadUsers({int? page = 1}) async {
    try {
      final response = await http.get(
        HttpUrls.users.url(queryParameters: {'page': '$page'}),
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception(response.body);
      }
    } on HttpException catch (e) {
      throw Exception('Message: ${e.message} \n Uri: ${e.uri}');
    } catch (e) {
      throw Exception(e);
    }
  }
}
