import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import '../../../../shared/icon_string.dart';
import '../../../../shared/shared_methods.dart';
import '../../../../shared/theme.dart';
import '../../../widgets/home_latest_transactions.dart';

class LatestTransactionHome extends StatelessWidget {
  const LatestTransactionHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transactions',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          14.heightBox,
          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.only(top: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              children: [
                HomeLatestTranscations(
                  iconUrl: IconString.transactionCat1,
                  title: 'Top Up',
                  time: 'Yesterday',
                  value: '+ ${formatCurrency(45000, symbol: '')}',
                ),
                HomeLatestTranscations(
                  iconUrl: IconString.transactionCat2,
                  title: 'Cashback',
                  time: 'Sep 11',
                  value: '+ ${formatCurrency(22000, symbol: '')}',
                ),
                HomeLatestTranscations(
                  iconUrl: IconString.transactionCat3,
                  title: 'Withdraw',
                  time: 'Sep 2',
                  value: '- ${formatCurrency(5000, symbol: '')}',
                ),
                HomeLatestTranscations(
                  iconUrl: IconString.transactionCat4,
                  title: 'Transfer',
                  time: 'Aug 27',
                  value: '- ${formatCurrency(123500, symbol: '')}',
                ),
                HomeLatestTranscations(
                  iconUrl: IconString.transactionCat5,
                  title: 'Electric',
                  time: 'Feb 18',
                  value: '- ${formatCurrency(12300000, symbol: '')}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
