import 'package:flutter/material.dart';

import '../../common/services/user.dart';
import '../../common/services/users.dart';
import '../widgets/profile_hero.dart';
import '../widgets/user_profile_analysis.dart';

class ProfileScreen extends StatelessWidget {
  final String? username;
  const ProfileScreen({Key? key, this.username}) : super(key: key);

  Future<User> get user async => await Users.getUser(username!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: FutureBuilder(
                future: user,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ProfileHero(
                      user: snapshot.data as User,
                    );
                  } else {
                    return const ProfileHero(
                      user: User(username: 'Loading...', image: null),
                    );
                  }
                }),
          ),
          const Flexible(
            flex: 1,
            child: UserProfileAnalysis(),
          ),
        ],
      ),
    );
  }
}
