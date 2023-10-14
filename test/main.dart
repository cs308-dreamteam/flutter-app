import 'package:bragi/login-register/screens/login_screen.dart';
import 'package:bragi/login-register/screens/register_screen.dart';
import 'package:bragi/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

Future<void> shootWidget(IntegrationTestWidgetsFlutterBinding binding,
    WidgetTester tester, Widget widget, String fileName) async {
  await tester.pumpWidget(widget);
  await binding.convertFlutterSurfaceToImage();
  await tester.pumpAndSettle();
  await binding.takeScreenshot('test/screenshots/$fileName.png');
}

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  group('Screenshot', () {
    testWidgets('Screenshot Home', (WidgetTester tester) async {
      await shootWidget(binding, tester, Briga(), 'home');
    });

    testWidgets('Screenshot Register', (WidgetTester tester) async {
      await shootWidget(binding, tester,
          Briga().integrateWidget(RegisterScreen()), 'register');
    });

    testWidgets('Screenshot Login', (WidgetTester tester) async {
      await shootWidget(
          binding, tester, Briga().integrateWidget(LoginScreen()), 'login');
    });
  });
}
