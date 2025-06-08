import 'dart:developer';

import 'package:product_project/core/constants/api_base.dart';
import 'package:product_project/core/constants/api_endpoints.dart';

class AuthRepository {
  Future<Map<String, String>> login(Map<String, String> body) async {
    final response = await Api.post(
      path: ApiEndpoints.login,
      body: body,
    );

    if (response.success) {
      final accessToken = response.data['accessToken'];
      final refreshToken = response.data['refreshToken'];

      log(response.data.toString());

      return {
        'accessToken': accessToken,
        'refreshToken': refreshToken,
      };
    } else {
      throw Exception('err');
    }
  }
}
