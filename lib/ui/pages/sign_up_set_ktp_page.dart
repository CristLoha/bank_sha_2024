import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:bank_sha/shared/box_extension.dart';
import 'package:bank_sha/ui/widgets/custom_filled_button.dart';
import '../../../shared/theme.dart';
import '../../shared/icon_string.dart';
import '../widgets/custom_image_logo.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_title_page.dart';

class SignUpSetKtpPage extends StatelessWidget {
  final SignUpFormModel data;
  const SignUpSetKtpPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        children: [
          const CustomImageLogo(),
          const CustomTitlePage(title: 'Verify Your\nAccount'),
          30.heightBox,
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: whiteColor,
            ),
            child: Column(
              children: [
                Container(
                  width: 120.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightBackgroundColor,
                  ),
                  child: Center(
                    child: Image.asset(
                      IconString.upload,
                      width: 32.w,
                    ),
                  ),
                ),
                16.heightBox,
                Text(
                  'Passport/ID Card',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                50.heightBox,
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  },
                )
              ],
            ),
          ),
          60.heightBox,
          CustomTextButton(
            title: 'Skip for Now',
            onPressed: () => Navigator.pushNamed(
              context,
              '/signup-success',
            ),
          )
        ],
      ),
    );
  }
}
