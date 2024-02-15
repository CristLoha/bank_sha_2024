import 'package:bank_sha/shared/box_extension.dart';
import 'package:bank_sha/ui/widgets/custom_filled_button.dart';
import 'package:bank_sha/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/theme.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        children: [
          30.heightBox,
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextFormField(
                  title: 'Username',
                  obscureText: false,
                ),
                16.heightBox,
                const CustomTextFormField(
                  title: 'Full Name',
                  obscureText: false,
                ),
                16.heightBox,
                const CustomTextFormField(
                  title: 'Email Address',
                  obscureText: false,
                ),
                16.heightBox,
                const CustomTextFormField(
                  title: 'Password',
                  obscureText: true,
                ),
                30.heightBox,
                CustomFilledButton(
                  title: 'Update Now',
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, '/profile-edit-success', (route) => false),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
