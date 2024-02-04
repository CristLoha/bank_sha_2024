import 'package:bank_sha/ui/pages/sign_page.dart';
import 'package:flutter/material.dart';
import '../ui/pages/not_found_page.dart';
import '../ui/pages/onboarding_page.dart';
import '../ui/pages/splash_page.dart';

class AppRouter {
  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );

      case '/onboarding':
        return MaterialPageRoute(
          builder: (context) => const OnboardingPage(),
        );

      case '/sign-in':
        return MaterialPageRoute(
          builder: (context) => const SignInPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        );
    }
  }
}
