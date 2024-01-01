import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softbase/data/datasources/local/local_storage.dart';
import 'package:softbase/data/di/injector.dart';
import 'package:softbase/presentation/cubits/theme/theme_cubit.dart';
import 'package:softbase/presentation/cubits/theme/theme_state.dart';

import 'config/providers/multi_provider.dart';
import 'config/routes/app_router.dart';
import 'data/datasources/firebase/remote_config/remote_config_manager.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    // await Firebase.initializeApp();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    //init dependencies
    await configureDependencies();

    await getIt.get<LocalStorage>().init();
    await getIt<RemoteConfigService>().fetch();

    runApp(EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        useOnlyLangCode: true,
        child: const MultiProviderApp(child: MyApp())));
  }, (error, stack) {
    log('Caught error in my root zone runZonedGuarded: $error');
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state.theme,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          onGenerateRoute: (settings) => AppRouter().onGenerateRouter(settings),
          initialRoute: ArchRouters.splash,
        );
      },
    );
  }
}
