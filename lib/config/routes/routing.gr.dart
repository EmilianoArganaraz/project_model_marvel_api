// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../presentation/comic/comic_detail.dart';
import '../../presentation/comic/comic_page.dart';
import '../../presentation/general/splash.dart';
import '../../presentation/users/user_page.dart';

class Routes {
  static const String splashScreen = '/';
  static const String comicPage = '/comic-page';
  static const String userPage = '/user-page';
  static const String comicDetail = '/comic-detail';
  static const all = <String>{
    splashScreen,
    comicPage,
    userPage,
    comicDetail,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.comicPage, page: ComicPage),
    RouteDef(Routes.userPage, page: UserPage),
    RouteDef(Routes.comicDetail, page: ComicDetail),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashScreen(),
        settings: data,
      );
    },
    ComicPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ComicPage().wrappedRoute(context),
        settings: data,
      );
    },
    UserPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const UserPage(),
        settings: data,
      );
    },
    ComicDetail: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ComicDetail(),
        settings: data,
      );
    },
  };
}
