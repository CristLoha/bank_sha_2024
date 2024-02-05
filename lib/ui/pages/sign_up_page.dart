import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';

import '../../shared/img_string.dart';
import '../../shared/theme.dart';
import '../widgets/custom_filled_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            width: 155,
            height: 55,
            margin: const EdgeInsets.only(
              top: 100,
              bottom: 100,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImgString.logoShaLight,
                ),
              ),
            ),
          ),
          Text(
            'Join Us to Unlock\nYour Growth',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          30.heightBox,
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadiusDirectional.circular(
                20,
              ),
            ),
            child: Column(
              children: [
                const CustomTextFormField(
                  title: 'Full Name',
                ),
                16.heightBox,
                const CustomTextFormField(
                  title: 'Email',
                ),
                16.heightBox,
                const CustomTextFormField(
                  title: 'Password',
                  obscureText: true,
                ),
                30.heightBox,
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up-profile');
                  },
                ),
              ],
            ),
          ),
          50.heightBox,
          CustomTextButton(
            title: 'Sign In',
            onPressed: () {},
          ),
          58.heightBox,
        ],
      ),
    );
  }
}
