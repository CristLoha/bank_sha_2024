import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/icon_string.dart';
import '../../../../shared/theme.dart';

class FLoatingActionButtonHome extends StatelessWidget {
  const FLoatingActionButtonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: purpleColor,
      child: Image.asset(
        IconString.plusCircle,
        width: 24.w,
      ),
      onPressed: () {},
    );
  }
}
