import 'dart:convert';

import 'package:bdcallingtaskmanagerapp/core/constants/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoginService {

  Future<void> loginUser({
    required String email,
    required String password,
    required void Function(Map<String, dynamic> data) onSuccess,
    required void Function(String message) onError,
  }) async {
    final Dio dio = Dio();
    final logger = Logger();

    try {


      final response = await dio.post(
        AppConstants.login,
        data: {

          'email': email,
          'password': password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 201 && response.data['success'] == true) {
        onSuccess(response.data);
      } else {
        final errorMsg = response.data['message'] ?? 'Registration failed';
        onError(errorMsg.toString());
      }
    } on DioError catch (dioError) {
      logger.e('Dio error during login', error: dioError);
      final errorMsg = dioError.response?.data['message'] ?? dioError.message;
      onError(errorMsg.toString());
    } catch (e) {
      logger.e('Unexpected error during login', error: e);
      onError('Unexpected error: ${e.toString()}');
    }
  }



}
