import 'package:bank_sha/ui/pages/pin/pin_page.dart';
import 'package:bank_sha/ui/pages/profile/profile_page.dart';
import 'package:bank_sha/ui/pages/signin/sign_in_page.dart';
import 'package:flutter/material.dart';
import '../ui/pages/home/home_page.dart';
import '../ui/pages/not_found_page.dart';
import '../ui/pages/onboarding/onboarding_page.dart';
import '../ui/pages/profile/profile_edit_page.dart';
import '../ui/pages/profile/profile_edit_pin_page.dart';
import '../ui/pages/profile/profile_edit_success_page.dart';
import '../ui/pages/signup/sign_up_page.dart';
import '../ui/pages/signup/sign_up_success_page.dart';
import '../ui/pages/splash_page.dart';
import '../ui/pages/top-up/top_up_amount_page.dart';
import '../ui/pages/top-up/top_up_page.dart';
import '../ui/pages/top-up/top_up_success_page.dart';

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

      case '/profile':
        return MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        );

      case '/pin':
        return MaterialPageRoute(
          builder: (context) => const PinPage(),
        );

      case '/profile-edit':
        return MaterialPageRoute(
          builder: (context) => const ProfileEditPage(),
        );

      case '/profile-edit-pin':
        return MaterialPageRoute(
          builder: (context) => const ProfileEditPinPage(),
        );

      case '/profile-edit-success':
        return MaterialPageRoute(
          builder: (context) => const ProfileEditSuccessPage(),
        );

      case '/topup':
        return MaterialPageRoute(
          builder: (context) => const TopUpPage(),
        );
      case '/topup-ammount':
        return MaterialPageRoute(
          builder: (context) => const TopUpAmountPage(),
        );
      case '/topup-success':
        return MaterialPageRoute(
          builder: (context) => const TopUpSuccessPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        );
    }
  }
}
