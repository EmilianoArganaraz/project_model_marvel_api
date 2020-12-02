import 'package:dio/dio.dart';

abstract class ApiMarvel{

  ApiMarvel(this.client);

  final Dio client;

  void addInterceptors(InterceptorsWrapper interceptorsWrapper);

}
