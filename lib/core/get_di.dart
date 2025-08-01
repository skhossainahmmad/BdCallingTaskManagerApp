import 'package:bdcallingtaskmanagerapp/features/registration/controllers/register_controller.dart';
import 'package:bdcallingtaskmanagerapp/features/registration/services/register_service.dart';
import 'package:get_it/get_it.dart';

import '../features/forget/controllers/forget_controller.dart';
import '../features/forget/services/forget_service.dart';
import '../features/login/controllers/login_controller.dart';
import '../features/login/services/login_service.dart';
import '../features/otp/controllers/otp_controller.dart';
import '../features/otp/services/otp_service.dart';
import '../features/reset/controllers/reset_controller.dart';
import '../features/reset/services/reset_service.dart';

final getIt = GetIt.instance;

void setupLocator() async {
  // Register services and controllers
  getIt.registerLazySingleton(() => RegisterService());
  getIt.registerLazySingleton( () => RegisterController(getIt<RegisterService>()));

  // Forget services and controllers
  getIt.registerLazySingleton(() => ForgetService());
  getIt.registerLazySingleton( () => ForgetController(getIt<ForgetService>()));

  // Login services and controllers
  getIt.registerLazySingleton(() => LoginService());
  getIt.registerLazySingleton( () => LoginController(getIt<LoginService>()));



  // OTP services and controllers
  getIt.registerLazySingleton(() => OTPService());
  getIt.registerLazySingleton( () => OTPController(getIt<OTPService>()));

  // Reset Password and controllers
  getIt.registerLazySingleton(() => ResetService());
  getIt.registerLazySingleton( () => ResetController(getIt<ResetService>()));





}
