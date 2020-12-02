import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:proyect_model_test/application/preferences/preferences_user.dart';
import 'package:proyect_model_test/config/env/environment_config.dart';
import 'package:proyect_model_test/config/injectable/injectable.config.dart';

final GetIt getIt = GetIt.instance;
EnvironmentConfig envConfig = getIt<EnvironmentConfig>();
PreferencesUser preferencesUser;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() async{
  $initGetIt(getIt, environment: EnvironmentConfig.env);
  preferencesUser = await getIt.getAsync<PreferencesUser>();
}