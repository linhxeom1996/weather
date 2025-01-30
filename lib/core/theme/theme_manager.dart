import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../local_storage/local_storage.dart';
import '../di/injector.dart';
import 'themes.dart';

@singleton
class ThemeManager {
  late AppThemeData appThemeData;
  final themeSubject = PublishSubject<AppThemeData>();
  Stream<AppThemeData> get themeStream => themeSubject.stream;

  getLastTheme() {
    appThemeData = getIt<LocalStorage>().isDarkMode == true ? AppThemeData.dark() : AppThemeData.light();
  }

  changeTheme(AppThemeData data) {
    appThemeData = data;
    themeSubject.add(data);
    getIt<LocalStorage>().setDarkMode(data.brightness == Brightness.dark);
  }
}
