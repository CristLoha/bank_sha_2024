import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/icon_string.dart';
import '../../../shared/img_string.dart';
import '../../../shared/theme.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/profile_menu_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          20.heightBox,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 22,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(ImgString.profile),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 0,
                      child: Container(
                        width: 28.h,
                        height: 28.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.check_circle,
                            color: greenColor,
                            size: 24.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                16.heightBox,
                Text(
                  'Shayna Hanna',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                40.heightBox,
                ProfileMenuItem(
                    iconUrl: IconString.editProfile,
                    title: 'Edit Profile',
                    onTap: () async {
                      if (await Navigator.pushNamed(context, '/pin') == true) {
                        if (mounted) {
                          Navigator.pushNamed(context, '/profile-edit');
                        }
                      }
                    }),
                ProfileMenuItem(
                    iconUrl: IconString.pin,
                    title: 'My PIN',
                    onTap: () async {
                      if (await Navigator.pushNamed(context, '/pin') == true) {
                        if (mounted) {
                          Navigator.pushNamed(context, '/profile-edit-pin');
                        }
                      }
                    }),
                ProfileMenuItem(
                  iconUrl: IconString.wallet,
                  title: 'Wallet Settings',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: IconString.reward,
                  title: 'My Rewards',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: IconString.help,
                  title: 'Help Center',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: IconString.logOut,
                  title: 'Log Out',
                  onTap: () {},
                ),
              ],
            ),
          ),
          87.heightBox,
          CustomTextButton(
            title: 'Report a Problem',
            onPressed: () {},
          ),
          50.heightBox,
        ],
      ),
    );
  }
}
