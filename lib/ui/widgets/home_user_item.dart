import 'package:bank_sha/shared/img_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/user_model.dart';
import '../../shared/theme.dart';

class HomeUserItem extends StatelessWidget {
  final UserModel user;

  const HomeUserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 120.h,
      margin: const EdgeInsets.only(right: 17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45.w,
            height: 45.h,
            margin: EdgeInsets.only(bottom: 13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: user.profilePicture == null
                    ? const AssetImage(
                        ImgString.profile,
                      )
                    : NetworkImage(user.profilePicture!) as ImageProvider,
              ),
            ),
          ),
          Text(
            '@${user.username}',
            style: blackTextStyle.copyWith(
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
