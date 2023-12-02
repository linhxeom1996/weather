import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:softbase/presentation/views/auth/forgot_pass/forgot_pass.dart';
import 'package:softbase/presentation/views/auth/login/login.dart';
import 'package:softbase/presentation/views/auth/otp/otp.dart';
import 'package:softbase/presentation/views/auth/register/register.dart';
import 'package:softbase/presentation/views/bottom/bottom_view.dart';
import 'package:softbase/presentation/views/search/search.dart';
import '../../presentation/views/intro/intro.dart';
import '../../presentation/views/splash/splash.dart';

class ArchRouters {
  static const splash = "/";
  static const intro = "/intro";
  static const login = "/login";
  static const register = "/register";
  static const forgotScreen = "/forgot_screen";
  static const home = "/home";
  static const search = "/search";
  static const cart = "/cart";
  static const otpScreen = "/otp_screen";
  static const newPassword = "/newPassword";
}

class AppRouter {
  Route? onGenerateRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ArchRouters.splash:
        return transitionPageDefault(child: const SplashPage());
      case ArchRouters.intro:
        return transitionPageRTL(child: const IntroPage());
      case ArchRouters.login:
        return transitionPageRTL(child: const LoginScreen());
      case ArchRouters.register:
        return transitionPageRTL(child: const RegisterScreen());
      case ArchRouters.forgotScreen:
        return transitionPageRTL(child: const ForgotScreen());
      case ArchRouters.home:
        return transitionPageRTL(child: const BottomView());
      case ArchRouters.search:
        return transitionPageBTT(child: const SearchScreen());
      case ArchRouters.otpScreen:
        return transitionPageRTL(child: const OTPScreen());
      case ArchRouters.newPassword:
        return transitionPageRTL(child: const NewPasswordScreen());
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
