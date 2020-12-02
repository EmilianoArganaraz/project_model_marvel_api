import 'package:proyect_model_test/config/env/environment_var.dart';

abstract class EnvironmentConfig implements EnvironmentVar{
  static const env = String.fromEnvironment('ENV', defaultValue: 'dev');
  // static const bool devMod =
  //     bool.fromEnvironment('DEVMOD', defaultValue: false);
  static const String prod = 'prod';
  static const String dev = 'dev';
  static const String qa = 'qa';
}