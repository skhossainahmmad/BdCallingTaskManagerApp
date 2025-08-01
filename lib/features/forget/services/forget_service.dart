import 'dart:convert';

import 'package:bdcallingtaskmanagerapp/core/constants/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ForgetService {
  Future<void> forgetPassword({
    required String email,
    required void Function(Map<String, dynamic> data) onSuccess,
    required void Function(String message) onError,
  }) async {
    final Dio dio = Dio();

    try {
      final response = await dio.post(
        AppConstants.forgotPassword,
        data: {'email': email},
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
      final errorMsg = dioError.response?.data['message'] ?? dioError.message;
      onError(errorMsg.toString());
    } catch (e) {
      onError('Unexpected error: ${e.toString()}');
    }
  }
}
