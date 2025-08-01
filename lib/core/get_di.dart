import 'package:bdcallingtaskmanagerapp/features/registration/controllers/register_controller.dart';
import 'package:bdcallingtaskmanagerapp/features/registration/services/register_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() async {
  getIt.registerLazySingleton(() => RegisterService());
  getIt.registerLazySingleton(
    () => RegisterController(getIt<RegisterService>()),
  );
}
