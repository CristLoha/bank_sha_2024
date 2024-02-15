import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import '../../../../shared/img_string.dart';
import '../../../../shared/theme.dart';
import '../../../widgets/transfer_result_user_item.dart';

class ResultsUsersTransfer extends StatelessWidget {
  const ResultsUsersTransfer({super.key});

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
            'Result',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          14.heightBox,
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 17,
            crossAxisSpacing: 17,
            shrinkWrap: true,
            children: const [
              TransferResultUserItem(
                imageUrl: ImgString.friend1,
                name: 'Yonna Jie',
                username: 'yoenna',
                isVerified: true,
              ),
              TransferResultUserItem(
                imageUrl: ImgString.friend4,
                name: 'Masayoshi',
                username: 'form',
                isSelected: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
