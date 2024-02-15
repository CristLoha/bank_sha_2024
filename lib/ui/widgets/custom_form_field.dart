import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextInputType? textInputType;
  final bool showTitle;
  final TextEditingController? controller;
  const CustomFormField({
    required this.title,
    this.obscureText = false,
    this.textInputType,
    this.showTitle = true,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        if (showTitle) 8.heightBox,
        TextFormField(
          controller: controller,
          keyboardType: textInputType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: !showTitle ? title : null,
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
