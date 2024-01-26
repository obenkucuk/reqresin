import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:reqres_in_api_example/constants/http_urls.dart';
import 'package:reqres_in_api_example/features/auth/model/login_response_model.dart';

class AuthService {
  const AuthService();

  Future<LoginResponseModel> login(
    String email,
    String password,
  ) async {
    try {
      final response = await http.post(
        HttpUrls.login.url(),
        body: <String, dynamic>{'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;

        final model = LoginResponseModel.fromJson(json);

        return model;
      } else {
        throw HttpException(response.body);
      }
    } on HttpException catch (e) {
      throw HttpException(e.message, uri: e.uri);
    } catch (e) {
      throw Exception(e);
    }
  }
}
