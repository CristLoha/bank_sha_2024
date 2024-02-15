import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/img_string.dart';
import '../../../shared/theme.dart';
import '../../widgets/bank_item.dart';
import '../../widgets/custom_filled_button.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Up'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          30.heightBox,
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          10.heightBox,
          Row(
            children: [
              Image.asset(
                ImgString.wallet,
                width: 80.w,
              ),
              16.widthBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '8008 2208 1996',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  2.heightBox,
                  Text(
                    'Angga Risky',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          40.heightBox,
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          14.heightBox,
          const BankItem(
            title: 'BANK BCA',
            imageUrl: ImgString.bca,
            isSelected: true,
          ),
          const BankItem(
            title: 'BANK BNI',
            imageUrl: ImgString.bni,
            isSelected: false,
          ),
          const BankItem(
            title: 'BANK Mandiri',
            imageUrl: ImgString.mandiri,
            isSelected: false,
          ),
          const BankItem(
            title: 'BANK OCBC',
            imageUrl: ImgString.ocbc,
            isSelected: false,
          ),
          12.heightBox,
          CustomFilledButton(
            title: 'Continue',
            onPressed: () => Navigator.pushNamed(
              context,
              '/topup-ammount',
            ),
          ),
          57.heightBox,
        ],
      ),
    );
  }
}
