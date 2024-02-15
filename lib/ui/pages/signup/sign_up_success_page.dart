import 'package:bank_sha/shared/box_extension.dart';
import 'package:bank_sha/ui/widgets/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/theme.dart';
import '../../widgets/custom_title_page.dart';

class SignUpSuccessPage extends StatelessWidget {
  const SignUpSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomTitlePage(
              title: 'Akun Berhasil\nTerdaftar',
              textAlign: TextAlign.center,
            ),
            26.heightBox,
            Text(
              'Grow your finance start\ntogether with us',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            50.heightBox,
            CustomFilledButton(
              width: 183.w,
              title: 'Get Started',
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false),
            ),
          ],
        ),
      ),
    );
  }
}
