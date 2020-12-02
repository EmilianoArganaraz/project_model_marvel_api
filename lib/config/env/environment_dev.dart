
import 'package:injectable/injectable.dart';
import 'package:proyect_model_test/config/env/environment_config.dart';

@Injectable(as: EnvironmentConfig, env: <String>[
  EnvironmentConfig.dev,
  EnvironmentConfig.qa,
])
class EnvironmentDev implements EnvironmentConfig{
  @override
  String get apiMarvelBaseUrl => 'https://gateway.marvel.com:443/v1/public/';

  @override
  String get appEnvironment => 'dev';

}