import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/shared_methods.dart';
import '../../../../shared/theme.dart';

class LevelHome extends StatelessWidget {
  const LevelHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: EdgeInsets.only(top: 20.h),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Level 1',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '55%',
                      style: greenTextStyle.copyWith(fontWeight: medium),
                    ),
                    Text(
                      'of ${formatCurrency(state.user.balance ?? 0)}',
                      style: blackTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
                10.heightBox,
                ClipRRect(
                  borderRadius: BorderRadius.circular(55),
                  child: LinearProgressIndicator(
                    value: 0.55,
                    minHeight: 5,
                    valueColor: AlwaysStoppedAnimation(greenColor),
                    backgroundColor: lightBackgroundColor,
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
