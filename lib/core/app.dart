import 'package:finance/view/onboarding/onboarding_page.dart';
import 'package:finance/view/sign_up/sign_up_page.dart';
import 'package:finance/view/splash/splash_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: defaultTheme,
      // home: const SplashPage(),
      // home: const OnboardingPage(),
      home: const SignUpPage(),
    );
  }
}
