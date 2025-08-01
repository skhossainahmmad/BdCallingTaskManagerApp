import 'package:bdcallingtaskmanagerapp/features/registration/model/registration_response.dart';
import 'package:bdcallingtaskmanagerapp/features/registration/services/register_service.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final RegisterService registerService;

  RegisterController(this.registerService);

  // Reactive state
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final Rx<RegistrationResponse?> response = Rx<RegistrationResponse?>(null);

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      // Reset state
      isLoading.value = true;
      errorMessage.value = '';
      response.value = null;

      // Call service
      final registrationResponse = await registerService.registerUser(
        fullName: fullName,
        email: email,
        password: password,
      );
      response.value = registrationResponse;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
