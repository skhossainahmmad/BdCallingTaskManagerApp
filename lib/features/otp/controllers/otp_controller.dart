import 'package:bdcallingtaskmanagerapp/features/registration/services/register_service.dart';
import 'package:get/get.dart';

import '../services/otp_service.dart';

class OTPController extends GetxController {
final OTPService otpService;

OTPController(this.otpService);

final RxBool isLoading = false.obs;
final RxString errorMessage = ''.obs;

Future<void> sendOtp({
  required String fullName,
  required String email,
  required String password,
  required void Function(Map<String, dynamic> data) onSuccess,
  required void Function(String message) onError,
}) async {
  isLoading.value = true;
  errorMessage.value = '';

  try {
    await otpService.sendOtp(
      email: email,
      onSuccess: (data) {
        isLoading.value = false;
        onSuccess(data);
      },
      onError: (message) {
        isLoading.value = false;
        errorMessage.value = message;
        onError(message);
      },
    );
  } catch (e) {
    isLoading.value = false;
    errorMessage.value = e.toString();
    onError(errorMessage.value);
  }
}
}
