import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomTitlePage extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;
  const CustomTitlePage({
    required this.title,
    this.textAlign,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: blackTextStyle.copyWith(
        fontSize: 20,
        fontWeight: semiBold,
      ),
      textAlign: textAlign,
    );
  }
}
