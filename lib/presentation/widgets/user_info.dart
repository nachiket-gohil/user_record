import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.userDetails,
    required this.icon,
  });

  final String userDetails;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: Colors.deepPurpleAccent,
          ),
        ),
        Text(
          userDetails,
          style: const TextStyle(
            fontSize: 18,
            height: 2,
          ),
        ),
      ],
    );
  }
}
