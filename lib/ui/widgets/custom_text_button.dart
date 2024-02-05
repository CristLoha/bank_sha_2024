import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomTextButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  const CustomTextButton({
    Key? key,
    this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: greyTextStyle.copyWith(
          fontSize: 16,
        ),
      ),
    );
  }
}
