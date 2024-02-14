import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/img_string.dart';
import '../../../../shared/shared_methods.dart';
import '../../../../shared/theme.dart';

class WalletCardHome extends StatelessWidget {
  const WalletCardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: const DecorationImage(
            image: AssetImage(
              ImgString.bgCard,
            ),
            fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shayna Hanna',
            style: whiteTextStyle.copyWith(
              fontSize: 18.sp,
              fontWeight: medium,
            ),
          ),
          14.heightBox,
          Text(
            '****  ****  **** 1280',
            style: whiteTextStyle.copyWith(
              fontSize: 18.sp,
              fontWeight: medium,
              letterSpacing: 4.50,
            ),
          ),
          21.heightBox,
          Text(
            'Balance',
            style: whiteTextStyle,
          ),
          Text(
            formatCurrency(12500),
            style: whiteTextStyle.copyWith(
              fontSize: 24.sp,
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
