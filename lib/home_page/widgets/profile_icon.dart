import 'package:bragi/common/services/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context
          .push('/profile/${GlobalVariables.authentication.user?.username}'),
      icon: Icon(
        Icons.person,
        size: 64,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }
}
