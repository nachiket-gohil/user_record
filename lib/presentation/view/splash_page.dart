import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_record/config/app_route.dart';

import '../bloc/auth_cubit.dart';
import 'list_page.dart';
import 'login_page.dart';

class AuthChecker extends StatefulWidget {
  const AuthChecker({super.key});

  @override
  _AuthCheckerState createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  void initState() {
    AppRoute.logScreenNames(AppRoute.splash);
    context.read<AuthCubit>().checkAuthStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state.isAuthenticated) {
          return const UserListPage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:user_record/config/app_route.dart';
// import 'package:user_record/core/constants/assets_path.dart';
//
// class SplashPage extends StatelessWidget {
//   const SplashPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Timer(
//       const Duration(seconds: 3),
//       () => Navigator.of(context).pushNamed(AppRoute.login),
//     );
//
//     // Use blockbuilder to detect signin
//     // then navigate
//     // if logged in - list
//     // else - sign in
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             AssetPath.logo,
//             height: 150,
//           ),
//           const Text('User is Logged in'),
//           ElevatedButton(
//             onPressed: () {},
//             child: const Text('Go to Home'),
//           )
//         ],
//       ),
//     );
//   }
// }
