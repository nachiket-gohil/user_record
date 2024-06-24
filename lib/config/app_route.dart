import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentation/view/detail_page.dart';
import '../presentation/view/list_page.dart';
import '../presentation/view/login_page.dart';
import '../presentation/view/splash_page.dart';
import 'analytics_mixin.dart';

class AppRoute {
  static const String splash = '/';
  static const String login = '/login';
  static const String list = '/list';
  static const String detail = '/detail';

  static Route generateRoute(RouteSettings routerSettings) {
    switch (routerSettings.name) {
      case splash:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => const SplashPage())
            : MaterialPageRoute(builder: (_) => const SplashPage());
      case login:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => LoginPage())
            : MaterialPageRoute(builder: (_) => LoginPage());
      case list:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => HomePage())
            : MaterialPageRoute(builder: (_) => HomePage());
      case detail:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => const DetailPage())
            : MaterialPageRoute(builder: (_) => const DetailPage());
      default:
        return errorRoute();
    }
  }

  static void logScreenNames(String name) {
    switch (name) {
      case splash:
        GoogleAnalyticsMixin.trackFirebaseScreenViewEvent(
          screenName: splash,
          screenClass: '$splash()',
        );
        break;
      case login:
        GoogleAnalyticsMixin.trackFirebaseScreenViewEvent(
          screenName: login,
          screenClass: '$login()',
        );
        break;
      case list:
        GoogleAnalyticsMixin.trackFirebaseScreenViewEvent(
          screenName: list,
          screenClass: '$list()',
        );
        break;
      case detail:
        GoogleAnalyticsMixin.trackFirebaseScreenViewEvent(
          screenName: detail,
          screenClass: '$detail()',
        );
        break;
    }
  }

  static Route errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.blue[50],
          title: const Text("Error 404"),
          content: const Text("Some Problem Occurred...\nPlease Try Again"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
