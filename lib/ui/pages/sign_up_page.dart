import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import '../../shared/img_string.dart';
import '../../shared/shared_methods.dart';
import '../../shared/theme.dart';
import '../widgets/custom_filled_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameC = TextEditingController(text: '');
  final emailC = TextEditingController(text: '');
  final passwordC = TextEditingController(text: '');

  bool validate() {
    if (nameC.text.isEmpty || emailC.text.isEmpty || passwordC.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

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
                CustomTextFormField(
                  title: 'Full Name',
                  controller: nameC,
                ),
                16.heightBox,
                CustomTextFormField(
                  title: 'Email',
                  controller: emailC,
                ),
                16.heightBox,
                CustomTextFormField(
                  title: 'Password',
                  obscureText: true,
                  controller: passwordC,
                ),
                30.heightBox,
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    if (validate()) {
                      Navigator.pushNamed(context, '/sign-up-profile');
                    } else {
                      showCustomSnackbar(context, 'Semua field harus diisi');
                    }
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
          30.heightBox,
        ],
      ),
    );
  }
}
