import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/theme.dart';

class HomeUserItem extends StatelessWidget {
  final String imageUrl;
  final String userName;

  const HomeUserItem({
    required this.imageUrl,
    required this.userName,
    super.key,
  });

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
            margin: const EdgeInsets.only(bottom: 13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  imageUrl,
                ),
              ),
            ),
          ),
          Text(
            userName,
            style: blackTextStyle.copyWith(
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
