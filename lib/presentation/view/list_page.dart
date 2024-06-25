// presentation/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_record/config/app_route.dart';

import '../bloc/auth_cubit.dart';
import '../bloc/user_list_cubit.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  void initState() {
    AppRoute.logScreenNames(AppRoute.list);
    // Call fetchUsers when the page is initialized
    context.read<UserListCubit>().fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
        backgroundColor: Colors.purpleAccent[100],
        shadowColor: Colors.purple[100],
        elevation: 6,
        toolbarHeight: 70,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthCubit>().logout();
              Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoute.login,
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<UserListCubit, UserListState>(
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
          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              final user = state.users[index];
              return ListTile(
                title: Text(user.name ?? ''),
                subtitle: Text(user.email ?? ''),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRoute.detail,
                    arguments: user.id,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
