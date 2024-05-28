import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:softbase/presentation/views/calendar/calendar.dart';
import 'package:softbase/presentation/views/history/history.dart';
import 'package:softbase/presentation/views/home/home.dart';
import 'package:softbase/presentation/views/notification/notification.dart';
import 'package:softbase/presentation/views/settings/setting.dart';

import '../../../utils/constains/colors.dart';
import '../../../utils/constains/icon.dart';
import '../../widgets/image_widget.dart';

enum BottomTab { home, calendar, notification, history, persion }

extension AppTabExtension on BottomTab {
  String get name {
    switch (this) {
      case BottomTab.home:
        return "home".tr();
      case BottomTab.calendar:
        return "calendar".tr();
      case BottomTab.notification:
        return "notification".tr();
      case BottomTab.history:
        return "history".tr();
      case BottomTab.persion:
        return "account".tr();
    }
  }

  Widget icon(bool sellected) {
    double size = 25;
    Color colorIcon = sellected ? ColorApp.colorB22 : ColorApp.colorE9E;
    switch (this) {
      case BottomTab.home:
        return ImageWidget(
            asset: IconApp.ic_tab_home,
            width: size,
            height: size,
            color: colorIcon);
      case BottomTab.calendar:
        return ImageWidget(
            asset: IconApp.ic_tab_calendar,
            width: size,
            height: size,
            color: colorIcon);
      case BottomTab.notification:
        return ImageWidget(
            asset: IconApp.ic_tab_notification,
            width: size,
            height: size,
            color: colorIcon);
      case BottomTab.history:
        return ImageWidget(
            asset: IconApp.ic_tab_histories,
            width: size,
            height: size,
            color: colorIcon);

      case BottomTab.persion:
        return ImageWidget(
            asset: IconApp.ic_tab_persion,
            width: size,
            height: size,
            color: colorIcon);
    }
  }

  Widget screen(BuildContext context) {
    switch (this) {
      case BottomTab.home:
        return const HomeScreen();
      case BottomTab.calendar:
        return const CalendarScreen();
      case BottomTab.history:
        return const HistoryScreen();
      case BottomTab.notification:
        return const NotificationScreen();
      case BottomTab.persion:
        return const SettingScreen();
    }
  }
}
