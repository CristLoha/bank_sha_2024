import 'dart:convert';
import 'dart:io';

import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/ui/pages/sign_up_set_ktp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bank_sha/shared/box_extension.dart';
import 'package:bank_sha/ui/widgets/custom_filled_button.dart';
import 'package:bank_sha/ui/widgets/custom_text_form_field.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/sign_up_form_model.dart';
import '../../shared/icon_string.dart';
import '../../shared/theme.dart';
import '../widgets/custom_image_logo.dart';
import '../widgets/custom_title_page.dart';

class SignUpSetProfilePage extends StatefulWidget {
  final SignUpFormModel data;
  const SignUpSetProfilePage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<SignUpSetProfilePage> createState() => _SignUpSetProfilePageState();
}

class _SignUpSetProfilePageState extends State<SignUpSetProfilePage> {
  final pinC = TextEditingController(text: '');
  XFile? selectedImage;

  bool validate() {
    if (pinC.text.length != 6) {
      return false;
    } else {
      return true;
    }
  }

  selectImage() async {
    final imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        children: [
          const CustomImageLogo(),
          const CustomTitlePage(title: 'Join Us to Unlock\nYour Growth'),
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
                    selectImage();
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
                  'Shayna Hanna',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                30.heightBox,
                CustomTextFormField(
                  title: 'Set PIN (6 digit number)',
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  controller: pinC,
                ),
                30.heightBox,
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    if (pinC.text.isEmpty) {
                      showCustomSnackbar(
                        context,
                        'Field PIN harus diisi',
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpSetKtpPage(
                            data: widget.data.copyWith(
                              profilePicture: selectedImage == null
                                  ? null
                                  : 'data:image/png;base64,${base64Encode(
                                      File(selectedImage!.path)
                                          .readAsBytesSync(),
                                    )}',
                              pin: pinC.text,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
