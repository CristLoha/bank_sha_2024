import 'package:bank_sha/ui/pages/sign_in_page.dart';
import 'package:bank_sha/ui/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import '../ui/pages/home/home_page.dart';
import '../ui/pages/not_found_page.dart';
import '../ui/pages/onboarding_page.dart';
import '../ui/pages/sign_up_success_page.dart';
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
      case '/sign-up':
        return MaterialPageRoute(
          builder: (context) => const SignUpPage(),
        );

      case '/signup-success':
        return MaterialPageRoute(
          builder: (context) => const SignUpSuccessPage(),
        );

      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        );
    }
  }
}
