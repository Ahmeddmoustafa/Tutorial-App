// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dev/presentation/Login/login_view.dart';
import 'package:flutter_dev/presentation/Main/main_view.dart';
import 'package:flutter_dev/presentation/Onboarding/onboarding_view.dart';
import 'package:flutter_dev/presentation/Register/register_view.dart';
import 'package:flutter_dev/Resources/strings_manager.dart';
import 'package:flutter_dev/presentation/splash/splash_view.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/store';
  static const String onBoardingRoute = '/onboarding';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        {
          return MaterialPageRoute(builder: (_) => SplashView());
        }
      case Routes.loginRoute:
        {
          return MaterialPageRoute(builder: (_) => LoginView());
        }
      case Routes.registerRoute:
        {
          return MaterialPageRoute(builder: (_) => RegisterView());
        }
      case Routes.forgotPasswordRoute:
        {
          return MaterialPageRoute(builder: (_) => SplashView());
        }
      case Routes.mainRoute:
        {
          return MaterialPageRoute(builder: (_) => MainView());
        }
      case Routes.storeDetailsRoute:
        {
          return MaterialPageRoute(builder: (_) => SplashView());
        }
      case Routes.onBoardingRoute:
        {
          return MaterialPageRoute(builder: (_) => OnBoardingView());
        }
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: Text(AppStrings.noRouteFound),
      ),
    );
  }
}
