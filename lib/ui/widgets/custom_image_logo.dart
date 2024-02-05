import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/img_string.dart';

class CustomImageLogo extends StatelessWidget {
  final double width;
  final double height;
  final double top;
  final double bottom;
  const CustomImageLogo({
    this.width = 155,
    this.height = 50,
    this.bottom = 100,
    this.top = 100,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height,
      margin: EdgeInsets.only(
        top: bottom,
        bottom: height,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            ImgString.logoShaLight,
          ),
        ),
      ),
    );
  }
}
