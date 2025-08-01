import 'dart:convert';

import 'package:bdcallingtaskmanagerapp/core/constants/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class OTPService {

  Future<void> sendOtp({
    required String email,

    required void Function(Map<String, dynamic> data) onSuccess,
    required void Function(String message) onError,
  }) async {
    final Dio dio = Dio();
    final logger = Logger();

    try {


      final response = await dio.post(
        AppConstants.resendOtp,
        data: {

          'email': email,
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
      logger.e('Dio error during OTP', error: dioError);
      final errorMsg = dioError.response?.data['message'] ?? dioError.message;
      onError(errorMsg.toString());
    } catch (e) {
      logger.e('Unexpected error during OTP', error: e);
      onError('Unexpected error: ${e.toString()}');
    }
  }



}
