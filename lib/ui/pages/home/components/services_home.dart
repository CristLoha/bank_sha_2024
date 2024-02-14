import 'package:bank_sha/shared/box_extension.dart';
import 'package:bank_sha/ui/pages/home/components/more_dialog_home.dart';
import 'package:flutter/material.dart';

import '../../../../shared/icon_string.dart';
import '../../../../shared/theme.dart';
import '../../../widgets/home_services_item.dart';

class ServicesHome extends StatelessWidget {
  const ServicesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          14.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServicesItem(
                iconUrl: IconString.topUp,
                title: 'Top Up',
                onTap: () => Navigator.pushNamed(context, '/topup'),
              ),
              HomeServicesItem(
                iconUrl: IconString.send,
                title: 'Send',
                onTap: () => Navigator.pushNamed(context, '/transfer'),
              ),
              HomeServicesItem(
                iconUrl: IconString.withDraw,
                title: 'Withdraw',
                onTap: () {},
              ),
              HomeServicesItem(
                iconUrl: IconString.more,
                title: 'More',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const MoreDialogHome(),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
