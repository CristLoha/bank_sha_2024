import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:bank_sha/shared/box_extension.dart';
import 'package:bank_sha/ui/widgets/custom_filled_button.dart';
import 'package:image_picker/image_picker.dart';
import '../../../shared/theme.dart';
import '../../shared/icon_string.dart';
import '../../shared/shared_methods.dart';
import '../widgets/custom_image_logo.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_title_page.dart';

class SignUpSetKtpPage extends StatefulWidget {
  final SignUpFormModel data;
  const SignUpSetKtpPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<SignUpSetKtpPage> createState() => _SignUpSetKtpPageState();
}

class _SignUpSetKtpPageState extends State<SignUpSetKtpPage> {
  bool validate() {
    if (selectedImage == null) {
      return false;
    } else {
      return true;
    }
  }

  XFile? selectedImage;
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
                GestureDetector(
                  onTap: () async {
                    final image = await selectImage();
                    setState(() {
                      selectedImage = image;
                    });
                  },
                  child: Container(
                    width: 120.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightBackgroundColor,
                      image: selectedImage == null
                          ? null
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(
                                  selectedImage!.path,
                                ),
                              ),
                            ),
                    ),
                    child: selectedImage != null
                        ? null
                        : Center(
                            child: Image.asset(
                              IconString.upload,
                              width: 32.w,
                            ),
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
                    if (validate()) {
                    } else {
                      showCustomSnackbar(context, 'Gambar tidak boleh kosong');
                    }
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
