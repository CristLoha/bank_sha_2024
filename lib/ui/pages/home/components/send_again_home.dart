import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import '../../../../shared/img_string.dart';
import '../../../../shared/theme.dart';
import '../../../widgets/home_user_item.dart';

class SendAgainHome extends StatelessWidget {
  const SendAgainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          14.heightBox,
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HomeUserItem(
                  imageUrl: ImgString.friend1,
                  userName: '@yuanita',
                ),
                HomeUserItem(
                  imageUrl: ImgString.friend2,
                  userName: '@jani',
                ),
                HomeUserItem(
                  imageUrl: ImgString.friend3,
                  userName: '@urip',
                ),
                HomeUserItem(
                  imageUrl: ImgString.friend4,
                  userName: '@masa',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
