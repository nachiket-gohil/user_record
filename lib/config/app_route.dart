import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentation/view/auth_checker_page.dart';
import '../presentation/view/login_page.dart';
import '../presentation/view/user_detail_page.dart';
import '../presentation/view/user_list_page.dart';
import 'analytics_mixin.dart';

class AppRoute {
  static const String splash = '/';
  static const String login = '/login';
  static const String list = '/list';
  static const String detail = '/detail';

  static Route generateRoute(RouteSettings routerSettings) {
    final int userId = (routerSettings.arguments ?? 0) as int;
    switch (routerSettings.name) {
      case splash:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => const AuthChecker())
            : MaterialPageRoute(builder: (_) => const AuthChecker());
      case login:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => LoginPage())
            : MaterialPageRoute(builder: (_) => LoginPage());
      case list:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => const UserListPage())
            : MaterialPageRoute(builder: (_) => const UserListPage());
      case detail:
        return Platform.isIOS
            ? CupertinoPageRoute(builder: (_) => UserDetailPage(userId: userId))
            : MaterialPageRoute(builder: (_) => UserDetailPage(userId: userId));
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
