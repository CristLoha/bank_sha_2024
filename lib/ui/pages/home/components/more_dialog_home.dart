import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/icon_string.dart';
import '../../../../shared/theme.dart';
import '../../../widgets/home_services_item.dart';

class MoreDialogHome extends StatelessWidget {
  const MoreDialogHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        height: 326.h,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          left: 30.w,
          right: 30.w,
          top: 30.h,
          bottom: 30.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: lightBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do More With Us',
              style: blackTextStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: semiBold,
              ),
            ),
            13.heightBox,
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 9,
                crossAxisSpacing: 9,
                childAspectRatio: 0.7,
                shrinkWrap: true,
                children: [
                  HomeServicesItem(
                    iconUrl: IconString.data,
                    title: 'Data',
                    onTap: () => Navigator.pushNamed(
                      context,
                      '/data-provider',
                    ),
                  ),
                  HomeServicesItem(
                    iconUrl: IconString.water,
                    title: 'Water',
                    onTap: () {},
                  ),
                  HomeServicesItem(
                    iconUrl: IconString.stream,
                    title: 'Stream',
                    onTap: () {},
                  ),
                  HomeServicesItem(
                    iconUrl: IconString.movie,
                    title: 'Movie',
                    onTap: () {},
                  ),
                  HomeServicesItem(
                    iconUrl: IconString.food,
                    title: 'Food',
                    onTap: () {},
                  ),
                  HomeServicesItem(
                    iconUrl: IconString.travel,
                    title: 'Travel',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
