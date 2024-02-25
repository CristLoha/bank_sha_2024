import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/operator_card/operator_card_bloc.dart';
import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/shared/box_extension.dart';
import 'package:bank_sha/ui/pages/package/data_package_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/img_string.dart';
import '../../../shared/shared_methods.dart';
import '../../../shared/theme.dart';
import '../../widgets/custom_filled_button.dart';
import '../../widgets/data_provider_item.dart';

class DataProviderPage extends StatefulWidget {
  const DataProviderPage({super.key});

  @override
  State<DataProviderPage> createState() => _DataProviderPageState();
}

class _DataProviderPageState extends State<DataProviderPage> {
  OperatorCardModel? selectedOperatorCard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Beli Data',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          30.heightBox,
          Text(
            'From Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          10.heightBox,
          Row(
            children: [
              Image.asset(
                ImgString.wallet,
                width: 80.w,
              ),
              16.widthBox,
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.cardNumber!.replaceAllMapped(
                              RegExp(r".{4}"), (match) => "${match.group(0)} "),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        2.heightBox,
                        Text(
                          'Balance: ${formatCurrency(state.user.balance ?? 0)}',
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        )
                      ],
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
          40.heightBox,
          Text(
            'Select Provider',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          14.heightBox,
          BlocProvider(
            create: (context) => OperatorCardBloc()..add(OperatorCardGet()),
            child: BlocBuilder<OperatorCardBloc, OperatorCardState>(
              builder: (context, state) {
                if (state is OperatorCardSuccess) {
                  return Column(
                      children: state.operatorCards.map((operatorCard) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedOperatorCard = operatorCard;
                        });
                      },
                      child: DataProviderItem(
                        operatorCard: operatorCard,
                        isSelected: operatorCard.id == selectedOperatorCard?.id,
                      ),
                    );
                  }).toList());
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          57.heightBox,
        ],
      ),
      floatingActionButton: (selectedOperatorCard != null)
          ? Container(
              margin: const EdgeInsets.all(24),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataPackagePage(
                        operatorCard: selectedOperatorCard!,
                      ),
                    ),
                  );
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
