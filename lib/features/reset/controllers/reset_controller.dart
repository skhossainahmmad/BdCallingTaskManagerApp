import 'package:get/get.dart';

import '../services/reset_service.dart';

class ResetController extends GetxController {
final ResetService resetService;

ResetController(this.resetService);

final RxBool isLoading = false.obs;
final RxString errorMessage = ''.obs;

Future<void> passwordReset({
  required String email,
  required String password,
  required void Function(Map<String, dynamic> data) onSuccess,
  required void Function(String message) onError,
}) async {
  isLoading.value = true;
  errorMessage.value = '';

  try {
    await resetService.passwordReset(
      email: email,
      password: password,
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
