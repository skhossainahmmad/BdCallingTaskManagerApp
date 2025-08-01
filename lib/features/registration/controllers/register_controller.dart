import 'package:bdcallingtaskmanagerapp/features/registration/services/register_service.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
final RegisterService registerService;

RegisterController(this.registerService);

final RxBool isLoading = false.obs;
final RxString errorMessage = ''.obs;

Future<void> register({
  required String fullName,
  required String email,
  required String password,
  required void Function(Map<String, dynamic> data) onSuccess,
  required void Function(String message) onError,
}) async {
  isLoading.value = true;
  errorMessage.value = '';

  try {
    await registerService.registerUser(
      fullName: fullName,
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
