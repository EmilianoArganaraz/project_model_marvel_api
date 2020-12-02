import 'package:auto_route/auto_route_annotations.dart';
import 'package:proyect_model_test/presentation/comic/comic_detail.dart';
import 'package:proyect_model_test/presentation/comic/comic_page.dart';

import '../../presentation/general/splash.dart';
import '../../presentation/users/user_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute<dynamic>>[
    // initial route is named "/"
    MaterialRoute<dynamic>(page: SplashScreen, initial: true),
    MaterialRoute<dynamic>(page: ComicPage),
    MaterialRoute<dynamic>(page: UserPage),
    MaterialRoute<dynamic>(page: ComicDetail),
  ],
)

class $Router {
  
}