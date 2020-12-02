import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'config/injectable/injectable.dart';
import 'config/routes/routing.gr.dart' as rt;
import 'presentation/core/styles/general_styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final rt.Router router = rt.Router();

  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
      translationLoader: FileTranslationLoader(
          basePath: 'lang', forcedLocale: const Locale('es', 'ES')));

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: materialTheme,
      child: PlatformProvider(
        builder: (BuildContext context) => PlatformApp(
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            flutterI18nDelegate,
            GlobalMaterialLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate
          ],
          supportedLocales: const <Locale>[
            Locale('en'),
            Locale('es')
          ],
          title: 'Proyect Model',
          material: (_, __) => MaterialAppData(
            theme: materialTheme
          ),
          cupertino: (_, __) => CupertinoAppData(
            theme: cupertinoTheme
          ),
          builder: ExtendedNavigator<rt.Router>(
            router: router,
          ),
          initialRoute: '/',
          onGenerateRoute: router.onGenerateRoute
        ),
      ),
    );
  }
}
