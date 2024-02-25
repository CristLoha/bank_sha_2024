// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:bank_sha/models/data_plan_model.dart';
import 'package:bank_sha/shared/box_extension.dart';

import '../../shared/shared_methods.dart';
import '../../shared/theme.dart';

class PackageItem extends StatelessWidget {
  final DataPlanModel dataPlan;
  final bool isSelected;
  const PackageItem({
    Key? key,
    required this.dataPlan,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155.w,
      height: 171.h,
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 22,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dataPlan.name.toString(),
            style: blackTextStyle.copyWith(
              fontSize: 32,
              fontWeight: medium,
            ),
          ),
          2.heightBox,
          Text(
            formatCurrency(dataPlan.price ?? 0),
            style: greyTextStyle.copyWith(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
