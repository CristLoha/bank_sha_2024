import 'package:bank_sha/blocs/tip/tip_bloc.dart';
import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/theme.dart';
import '../../../widgets/home_tips_item.dart';

class FriendlyTipsHome extends StatelessWidget {
  const FriendlyTipsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          14.heightBox,
          BlocProvider(
            create: (context) => TipBloc()..add(TipGet()),
            child: BlocBuilder<TipBloc, TipState>(
              builder: (context, state) {
                if (state is TipSuccess) {
                  return GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 17,
                      childAspectRatio: 0.87,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      children: state.tips.map((tip) {
                        return HomeTipsItem(tip: tip);
                      }).toList());
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
