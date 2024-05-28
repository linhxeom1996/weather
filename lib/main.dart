import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:softbase/data/datasources/local/local_storage.dart';
import 'package:softbase/data/di/injector.dart';
import 'package:softbase/presentation/views/theme_manager/theme_manager.dart';
import 'package:softbase/utils/constains/themes.dart';

import 'app_router.dart';
import 'data/datasources/firebase/remote_config/remote_config_manager.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await Firebase.initializeApp();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    //init dependencies
    await configureDependencies();

    await getIt.get<LocalStorage>().init();
    await getIt<RemoteConfigService>().fetch();
    await getIt<ThemeManager>().getLastTheme();

    runApp(EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        useOnlyLangCode: true,
        child: const MainApp()));
  }, (error, stack) {
    log('Caught error in my root zone runZonedGuarded: $error');
  });
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MyAppState();
}

class _MyAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppThemeData>(
        initialData: getIt<ThemeManager>().appThemeData,
        stream: getIt<ThemeManager>().themeStream,
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: snapshot.data?.themeData,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            onGenerateRoute: (settings) =>
                AppRouter().onGenerateRouter(settings),
            initialRoute: ArchRouters.splash,
          );
        });
  }
}
