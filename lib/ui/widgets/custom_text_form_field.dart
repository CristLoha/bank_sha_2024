import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final bool isShowTittle;
  final TextInputType? keyboardType;
  const CustomTextFormField({
    Key? key,
    required this.title,
    this.obscureText = false,
    this.isShowTittle = true,
    this.keyboardType,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
        8.heightBox,
        TextFormField(
          onChanged: onChanged,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: !isShowTittle ? title : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
        ),
      ],
    );
  }
}
