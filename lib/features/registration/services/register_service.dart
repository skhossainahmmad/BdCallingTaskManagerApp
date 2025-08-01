import 'dart:convert';

import 'package:bdcallingtaskmanagerapp/core/constants/app_constants.dart';
import 'package:bdcallingtaskmanagerapp/features/registration/model/registration_response.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class RegisterService {
  Future<RegistrationResponse> registerUser({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      var logger = Logger();
      logger.e(
        '-------------------------Error-Param------------------------',
        error: 'Name: $fullName , Email:$email,Password:$password',
      );

      final response = await http.post(
        Uri.parse(AppConstants.login),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': '*',
        },
        body: jsonEncode({
          'fullName': fullName,
          'email': email,
          'password': password,
        }),
      );

      final responseData = jsonDecode(response.body);

      logger.e(
        '-------------------------Error-Param------------------------',
        error: 'Name: $fullName , Email:$email,Password:$password',
      );

      logger.e(
        '----------------Error-Res----------',
        error: 'Res:' + responseData.toString(),
      );

      if (response.statusCode == 201) {
        return RegistrationResponse.fromJson(responseData);
      } else {
        throw Exception(responseData['message'] ?? 'Registration failed');
      }
    } catch (e) {
      throw Exception('Network error: ${e.toString()}');
    }
  }
}
