import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/icon_string.dart';
import '../../../shared/theme.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: whiteColor,
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      notchMargin: 6,
      elevation: 0,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: whiteColor,
        selectedItemColor: blueColor,
        unselectedItemColor: blackColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle:
            blueTextStyle.copyWith(fontSize: 10.sp, fontWeight: medium),
        unselectedLabelStyle:
            blackTextStyle.copyWith(fontSize: 10.sp, fontWeight: medium),
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                IconString.overview,
                width: 20.w,
                color: blueColor,
              ),
              label: 'Overview'),
          BottomNavigationBarItem(
              icon: Image.asset(
                IconString.history,
                width: 20.w,
              ),
              label: 'History'),
          BottomNavigationBarItem(
              icon: Image.asset(
                IconString.statistic,
                width: 20.w,
              ),
              label: 'Statistic'),
          BottomNavigationBarItem(
              icon: Image.asset(
                IconString.reward,
                width: 20.w,
              ),
              label: 'Reward'),
        ],
      ),
    );
  }
}
