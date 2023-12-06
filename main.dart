import 'package:flutter/material.dart';

import 'ProfilePage.dart';
import 'RecommendedPage.dart';
import 'HorScrList.dart';
import 'Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      home: HomePage(),
      routes: {
        '/profile': (context) => ProfilePage(),
        '/recommended': (context) => RecommendedPage(),
      },
    );
  }
}
