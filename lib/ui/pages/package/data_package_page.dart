import 'package:bank_sha/blocs/data_plan/data_plan_bloc.dart';
import 'package:bank_sha/models/data_plan_form_model.dart';
import 'package:bank_sha/models/data_plan_model.dart';
import 'package:flutter/material.dart';
import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../models/operator_card_model.dart';
import '../../../shared/shared_methods.dart';
import '../../../shared/theme.dart';
import '../../widgets/custom_filled_button.dart';
import '../../widgets/custom_form_field.dart';
import '../../widgets/package_item.dart';

class DataPackagePage extends StatefulWidget {
  final OperatorCardModel operatorCard;
  const DataPackagePage({
    Key? key,
    required this.operatorCard,
  }) : super(key: key);

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final phoneC = TextEditingController(text: '');
  DataPlanModel? selectedDataPlan;

  Future<void> goToBuyData() async {
    final authBloc = context.read<AuthBloc>();
    final dataPlanBloc = context.read<DataPlanBloc>();
    if (await Navigator.pushNamed(context, '/pin') == true) {
      final authState = authBloc.state;
      String pin = '';
      if (authState is AuthSuccess) {
        pin = authState.user.pin!;
      }
      dataPlanBloc.add(
        DataPlanPost(
          DataPlanFormModel(
            dataPlanId: selectedDataPlan!.id,
            phoneNumber: phoneC.text,
            pin: pin,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataPlanBloc, DataPlanState>(
      listener: (context, state) {
        if (state is DataPlanFailed) {
          showCustomSnackbar(context, state.e);
        }
        if (state is DataPlanSuccess) {
          context.read<AuthBloc>().add(
                AuthUpdateBalance(
                  selectedDataPlan!.price! * -1,
                ),
              );

          Navigator.of(context)
              .pushNamedAndRemoveUntil('/data-success', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is DataPlanLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Paket Data'),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            children: [
              30.heightBox,
              Text(
                'Phone Number',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              26.heightBox,
              CustomFormField(
                title: '+628',
                isShowTitle: false,
                controller: phoneC,
              ),
              40.heightBox,
              Text(
                'Select Package',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              14.heightBox,
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 17,
                childAspectRatio: 0.82,
                shrinkWrap: true,
                children: widget.operatorCard.dataPlans!.map((dataPlan) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDataPlan = dataPlan;
                      });
                    },
                    child: PackageItem(
                      dataPlan: dataPlan,
                      isSelected: dataPlan.id == selectedDataPlan?.id,
                    ),
                  );
                }).toList(),
              ),
              130.heightBox,
            ],
          ),
          floatingActionButton:
              (selectedDataPlan != null && phoneC.text.isNotEmpty)
                  ? Container(
                      margin: const EdgeInsets.all(24),
                      child: CustomFilledButton(
                        title: 'Continue',
                        onPressed: () {
                          goToBuyData();
                        },
                      ),
                    )
                  : Container(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
