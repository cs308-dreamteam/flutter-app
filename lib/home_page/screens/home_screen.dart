import 'package:bragi/home_page/widgets/navigation_button.dart';
import 'package:bragi/home_page/widgets/welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/profile_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            direction: Axis.horizontal,
            runSpacing: 32,
            children: [
              const Row(
                children: [
                  Flexible(child: FittedBox(child: WelcomeText())),
                  ProfileIcon(),
                ],
              ),
              NavigationButton(
                tag: 'search',
                text: 'Search People',
                action: () {
                  context.push('/peopleSearch');
                },
                icon: const Icon(
                  Icons.people,
                  size: 128,
                  color: Colors.white,
                ),
              ),
              NavigationButton(
                tag: 'library',
                text: 'Song Library',
                action: () {
                  context.push('/library');
                },
                icon: const Icon(
                  Icons.library_books,
                  size: 128,
                  color: Colors.white,
                ),
              ),
              NavigationButton(
                tag: 'recommendation',
                text: 'Recommendation',
                action: () {
                  context.push('/recommendations');
                },
                icon: const Icon(
                  Icons.recommend,
                  size: 128,
                  color: Colors.white,
                ),
              ),
              NavigationButton(
                tag: 'analysis',
                text: 'Analysis',
                action: () {
                  context.push('/analysis');
                },
                icon: const Icon(
                  Icons.analytics,
                  size: 128,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
