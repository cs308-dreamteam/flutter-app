import 'package:bragi/profile/widgets/profile_screen.dart';
import 'package:bragi/song_upload/database_connection/database_connection_results.dart';
import 'package:bragi/song_upload/manual_entry/screens/manual_entry_screen.dart';
import 'package:bragi/song_upload/screens/song_upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'login-register/screens/login_screen.dart';
import 'login-register/screens/register_screen.dart';

void main() async {
  runApp(Briga());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ManualEntryScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/upload',
      builder: (context, state) => const SongUploadScreen(),
    ),
    GoRoute(
      path: '/databaseConnectionResults',
      builder: (context, state) => const DatabaseConnectionResults(),
    )
  ],
);

ColorScheme lightScheme = const ColorScheme.light().copyWith(
  primary: const Color(0xFFED6C44),
  onPrimary: const Color(0xFFF8F3F0),
  primaryContainer: const Color(0xFF4BC5C3),
  onPrimaryContainer: const Color(0xFF250505),
  secondaryContainer: const Color(0xFF4C4743),
  onSecondaryContainer: const Color(0xFFF8F3F0),
  secondary: const Color(0xFFFFB230),
  onSecondary: const Color(0xFFF8F3F0),
  tertiary: const Color(0xFFC3A279),
  onTertiary: const Color(0xFFF8F3F0),
  onBackground: const Color(0xFF250505),
  onSurface: const Color(0xFF251605),
);

ColorScheme darkScheme = const ColorScheme.dark().copyWith();

class Briga extends StatelessWidget {
  Briga({super.key});

  final app = MaterialApp.router(
    theme: ThemeData(
      colorScheme: lightScheme,
      fontFamily: 'Poppins',
    ),
    routerConfig: _router,
  );

  @override
  Widget build(BuildContext context) {
    return app;
  }

  Widget integrateWidget(Widget widget) {
    return MaterialApp(
      theme: app.theme,
      home: widget,
    );
  }
}
