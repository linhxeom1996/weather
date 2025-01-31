import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:softbase/features/home/presentation/views/home.dart';
import '../../../features/splash/splash.dart';

class ArchRouters {
  static const splash = "/";
  static const home = "/home";
  static const cart = "/cart";
  static const otpScreen = "/otp_screen";
}

class AppRouter {
  Route? onGenerateRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ArchRouters.splash:
        return transitionPageDefault(child: const SplashPage());
      // case ArchRouters.search:
      //   return transitionPageBTT(child: const SearchScreen());
      case ArchRouters.home:
        return transitionPageBTT(child: const HomeScreen());
      default:
        return null;
    }
  }

  MaterialPageRoute transitionPageDefault(
      {required Widget child, RouteSettings? settings}) {
    return MaterialPageRoute(builder: (_) => child, settings: settings);
  }

  PageTransition transitionPageRTL(
      {required Widget child, RouteSettings? settings}) {
    return PageTransition(
        child: child,
        type: PageTransitionType.rightToLeft,
        duration: const Duration(milliseconds: 300),
        settings: settings);
  }

  PageTransition transitionPageBTT(
      {required Widget child, RouteSettings? settings}) {
    return PageTransition(
        child: child,
        type: PageTransitionType.bottomToTop,
        duration: const Duration(milliseconds: 300),
        settings: settings);
  }
}
