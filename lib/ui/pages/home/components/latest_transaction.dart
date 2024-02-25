import 'package:bank_sha/blocs/transaction/transaction_bloc.dart';
import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            child: BlocProvider(
              create: (context) => TransactionBloc()..add(TransactionGet()),
              child: BlocBuilder<TransactionBloc, TransactionState>(
                builder: (context, state) {
                  if (state is TransactionSuccess) {
                    return Column(
                      children: state.transactions.map((transaction) {
                        return HomeLatestTranscations(transaction: transaction);
                      }).toList(),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
