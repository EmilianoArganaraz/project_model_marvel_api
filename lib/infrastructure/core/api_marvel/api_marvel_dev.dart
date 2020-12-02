
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:proyect_model_test/config/env/environment_config.dart';
import 'package:proyect_model_test/config/injectable/injectable.dart';
import 'package:proyect_model_test/infrastructure/core/api_marvel/api_marvel.dart';

@Injectable(as: ApiMarvel, env: <String>[
  EnvironmentConfig.dev,
  EnvironmentConfig.qa,
])
@lazySingleton
class ApiMarvelDev extends ApiMarvel {
  ApiMarvelDev() : super (Dio(_baseOptions)){
    addInterceptors(interceptorsWrapper);
  }

  static final BaseOptions _baseOptions =
      BaseOptions(baseUrl: envConfig.apiMarvelBaseUrl);

  final InterceptorsWrapper interceptorsWrapper =
      InterceptorsWrapper(onRequest: (RequestOptions options) async {

    options.queryParameters.addAll(<String, dynamic>{
      'ts': 1,
      'apikey': '975da059b37c72049c729f86bd007c4b',
      'hash': 'fd01353889cc4994572896c153e306db'
    });
    return options;
  });

  @override
  void addInterceptors(InterceptorsWrapper interceptorsWrapper) {
    client.interceptors.add(interceptorsWrapper);
  }
}
