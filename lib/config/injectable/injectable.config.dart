// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../infrastructure/core/api_marvel/api_marvel.dart';
import '../../infrastructure/core/api_marvel/api_marvel_dev.dart';
import '../../infrastructure/comic/repositories/comic_repository.dart';
import '../../infrastructure/comic/services/comic_services.dart';
import '../../application/comics/comic_state.dart';
import '../env/environment_config.dart';
import '../env/environment_dev.dart';
import '../../application/preferences/preferences_user.dart';

/// Environment names
const _dev = 'dev';
const _qa = 'qa';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<ApiMarvel>(() => ApiMarvelDev(), registerFor: {_dev, _qa});
  gh.lazySingleton<ComicRepository>(() => ComicRepository(get<ApiMarvel>()));
  gh.factory<ComicServices>(() => ComicServices(get<ComicRepository>()));
  gh.factory<EnvironmentConfig>(() => EnvironmentDev(),
      registerFor: {_dev, _qa});

  // Eager singletons must be registered in the right order
  gh.singleton<ComicState>(ComicState(get<ComicServices>()));
  gh.singletonAsync<PreferencesUser>(() => PreferencesUser.init());
  return get;
}
