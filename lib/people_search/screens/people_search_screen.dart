import 'package:bragi/home_page/widgets/navigation_button.dart';
import 'package:flutter/material.dart';

import '../widgets/people_search_bar.dart';

class PeopleSearchScreen extends StatelessWidget {
  const PeopleSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            NavigationButton(
                    tag: 'search',
                    text: "People Search",
                    action: () => {},
                    icon: Icon(Icons.search))
                .buildTopBar(context),
            PeopleSearchBar(),
          ],
        ),
      ),
    );
  }
}
