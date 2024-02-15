import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import '../../../../shared/img_string.dart';
import '../../../../shared/theme.dart';
import '../../../widgets/transfer_recent_user_item.dart';

class RecentsUsersTransfer extends StatelessWidget {
  const RecentsUsersTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          14.heightBox,
          const TransferRecentUserItem(
            imageUrl: ImgString.friend1,
            name: 'Yonna Jie',
            username: 'yoenna',
            isVerified: true,
          ),
          const TransferRecentUserItem(
            imageUrl: ImgString.friend3,
            name: 'John Hi',
            username: 'hi',
          ),
          const TransferRecentUserItem(
            imageUrl: ImgString.friend4,
            name: 'Masayoshi',
            username: 'form',
          )
        ],
      ),
    );
  }
}
