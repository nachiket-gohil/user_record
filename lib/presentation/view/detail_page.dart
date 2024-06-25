import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_record/presentation/widgets/user_info.dart';

import '../../config/app_route.dart';
import '../bloc/user_detail_cubit.dart';

class UserDetailPage extends StatefulWidget {
  final int userId;

  const UserDetailPage({super.key, required this.userId});

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  void initState() {
    AppRoute.logScreenNames(AppRoute.detail);
    // Call fetchUserDetail when the page is initialized
    context.read<UserDetailCubit>().fetchUserDetail(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Detail"),
        backgroundColor: Colors.purpleAccent[100],
        shadowColor: Colors.purple[100],
        elevation: 6,
        toolbarHeight: 70,
      ),
      body: BlocBuilder<UserDetailCubit, UserDetailState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.error != null) {
            return Center(
              child: Text(state.error!),
            );
          }
          if (state.user == null) {
            return const Center(
              child: Text("User not found"),
            );
          }
          final user = state.user!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserInfo(
                  icon: Icons.person_2_outlined,
                  userDetails: "Name: ${user.name}",
                ),
                UserInfo(
                  icon: Icons.verified_user_outlined,
                  userDetails: "Username: ${user.username}",
                ),
                UserInfo(
                  icon: Icons.email_outlined,
                  userDetails: "Email: ${user.email}",
                ),
                UserInfo(
                  icon: Icons.phone,
                  userDetails: "Phone: ${user.phone}",
                ),
                UserInfo(
                  icon: Icons.web,
                  userDetails: "Website: ${user.website}",
                ),
                UserInfo(
                  icon: Icons.location_city_outlined,
                  userDetails: "Company: ${user.company?.name}",
                ),
                UserInfo(
                  icon: Icons.home_outlined,
                  userDetails: "Address: ${user.address?.street}, ${user.address?.city}",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
