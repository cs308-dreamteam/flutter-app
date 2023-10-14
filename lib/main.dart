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
      builder: (context, state) => RegisterScreen(),
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
      builder: (context, state) => RegisterScreen(),
    ),
  ],
);

ColorScheme lightScheme = const ColorScheme.light().copyWith(
  primary: const Color(0xFFED6C44),
  onPrimary: const Color(0xFFF8F3F0),
  primaryContainer: const Color(0xFF4BC5C3),
  onPrimaryContainer: const Color(0xFF250505),
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
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: const Color(0xFFED6C44),
        ),
      ),
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
