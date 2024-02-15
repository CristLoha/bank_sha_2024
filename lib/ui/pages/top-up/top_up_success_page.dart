import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/theme.dart';
import '../../widgets/custom_filled_button.dart';
import '../../widgets/custom_title_page.dart';

class TopUpSuccessPage extends StatelessWidget {
  const TopUpSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTitlePage(
              title: 'Top Up\nWallet Berhasil',
              textAlign: TextAlign.center,
            ),
            26.heightBox,
            Text(
              'Use the money wisely and\ngrow your finance',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            50.heightBox,
            CustomFilledButton(
              width: 183.w,
              title: 'Back to Home',
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false),
            ),
          ],
        ),
      ),
    );
  }
}
