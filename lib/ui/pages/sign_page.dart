import 'package:flutter/material.dart';
import 'package:bank_sha/shared/box_extension.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/custom_text_button.dart';
import '../widgets/custom_filled_button.dart';
import '../widgets/custom_image_logo.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_title_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const CustomImageLogo(),
          const CustomTitlePage(title: 'Sign In &\nGrow Your Financeh'),
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
                  title: 'Email',
                ),
                16.heightBox,
                const CustomTextFormField(
                  title: 'Password',
                  obscureText: true,
                ),
                8.heightBox,
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password',
                    style: blueTextStyle,
                  ),
                ),
                30.heightBox,
                CustomFilledButton(
                  title: 'Sign In',
                  onPressed: () {},
                ),
              ],
            ),
          ),
          50.heightBox,
          CustomTextButton(
            title: 'Create New Account',
            onPressed: () => Navigator.pushNamed(context, '/sign-up'),
          ),
          58.heightBox,
        ],
      ),
    );
  }
}
