import 'package:bdcallingtaskmanagerapp/features/registration/services/register_service.dart';
import 'package:get/get.dart';

import '../services/login_service.dart';

class LoginController extends GetxController {
final LoginService loginService;

LoginController(this.loginService);

final RxBool isLoading = false.obs;
final RxString errorMessage = ''.obs;

Future<void> login({
  required String email,
  required String password,
  required void Function(Map<String, dynamic> data) onSuccess,
  required void Function(String message) onError,
}) async {
  isLoading.value = true;
  errorMessage.value = '';

  try {
    await loginService.loginUser(

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
