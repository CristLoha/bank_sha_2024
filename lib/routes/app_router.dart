import 'package:bank_sha/ui/pages/sign_page.dart';
import 'package:bank_sha/ui/pages/sign_up_page.dart';
import 'package:bank_sha/ui/pages/sign_up_set_profile_page.dart';
import 'package:flutter/material.dart';
import '../ui/pages/home_page.dart';
import '../ui/pages/not_found_page.dart';
import '../ui/pages/onboarding_page.dart';
import '../ui/pages/sign_up_set_ktp_page.dart';
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
      case '/sign-up-set-profile':
        return MaterialPageRoute(
          builder: (context) => const SignUpSetProfilePage(),
        );

      case '/sign-up-set-ktp':
        return MaterialPageRoute(
          builder: (context) => const SignUpSetKtpPage(),
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
