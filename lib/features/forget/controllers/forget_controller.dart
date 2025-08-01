import 'package:bdcallingtaskmanagerapp/features/registration/services/register_service.dart';
import 'package:get/get.dart';

import '../services/forget_service.dart';

class ForgetController extends GetxController {
  final ForgetService forgetService;

  ForgetController(this.forgetService);

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  Future<void> forgetPassword({
    required String email,
    required void Function(Map<String, dynamic> data) onSuccess,
    required void Function(String message) onError,
  }) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      await forgetService.forgetPassword(
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
