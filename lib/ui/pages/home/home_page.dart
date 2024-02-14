import 'package:bank_sha/ui/pages/home/components/floating_action_button_home.dart';
import 'package:bank_sha/ui/pages/navbar/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components/friendly_tips_home.dart';
import 'components/latest_transaction.dart';
import 'components/level_home.dart';
import 'components/profile_home.dart';
import 'components/send_again_home.dart';
import 'components/services_home.dart';
import 'components/wallet_card_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: const [
          ProfileHome(),
          WalletCardHome(),
          LevelHome(),
          ServicesHome(),
          LatestTransactionHome(),
          SendAgainHome(),
          FriendlyTipsHome(),
        ],
      ),
      bottomNavigationBar: const BottomNavbar(),
      floatingActionButton: const FLoatingActionButtonHome(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
