import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/transfer/transfer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:bank_sha/models/transfer_form_model.dart';
import 'package:bank_sha/shared/box_extension.dart';
import '../../../shared/shared_methods.dart';
import '../../../shared/theme.dart';
import '../../widgets/custom_filled_button.dart';
import '../../widgets/custom_number_button.dart';
import '../../widgets/custom_text_button.dart';

class TransferAmountPage extends StatefulWidget {
  final TransferFormModel data;
  const TransferAmountPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<TransferAmountPage> createState() => _TransferAmountPageState();
}

class _TransferAmountPageState extends State<TransferAmountPage> {
  final TextEditingController amountC = TextEditingController(text: '0');
  @override
  void initState() {
    super.initState();
    amountC.addListener(() {
      final text = amountC.text;

      amountC.value = amountC.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          int.parse(
            text.replaceAll('.', ''),
          ),
        ),
      );
    });
  }

  addAmmount(String number) {
    if (amountC.text == '0') {
      amountC.text = '';
    }
    setState(() {
      amountC.text = amountC.text + number;
    });
  }

  deleteAmmount() {
    if (amountC.text.isNotEmpty) {
      setState(() {
        amountC.text = amountC.text.substring(0, amountC.text.length - 1);
        if (amountC.text == '') {
          amountC.text = '0';
        }
      });
    }
  }

  Future<void> goToTransfer() async {
    final authBloc = context.read<AuthBloc>();
    final transferBloc = context.read<TransferBloc>();
    if (await Navigator.pushNamed(context, '/pin') == true && mounted) {
      final authState = authBloc.state;
      String pin = '';
      if (authState is AuthSuccess) {
        pin = authState.user.pin!;
      }
      transferBloc.add(
        TransferPost(
          widget.data.copyWith(
            pin: pin,
            amount: amountC.text.replaceAll('.', ''),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocConsumer<TransferBloc, TransferState>(
        listener: (context, state) async {
          if (state is TransferFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is TransferSuccess) {
            final topupUpdate = context.read<AuthBloc>();

            final navigator = Navigator.of(context);

            topupUpdate.add(
              AuthUpdateBalance(
                int.parse(
                      amountC.text.replaceAll('.', ''),
                    ) *
                    -1,
              ),
            );

            if (mounted) {
              navigator.pushNamedAndRemoveUntil(
                  '/transfer-success', (route) => false);
            }
          }
        },
        builder: (context, state) {
          if (state is TransferLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 58,
            ),
            children: [
              60.heightBox,
              Center(
                child: Text(
                  'Total Amount',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                ),
              ),
              67.heightBox,
              Align(
                child: SizedBox(
                  width: 200.w,
                  child: TextFormField(
                    controller: amountC,
                    cursorColor: greyColor,
                    enabled: false,
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                    ),
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                      ),
                      prefixIcon: Text(
                        'Rp ',
                        style: whiteTextStyle.copyWith(
                          fontSize: 36,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              66.heightBox,
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 45,
                childAspectRatio: 1,
                shrinkWrap: true,
                children: [
                  CustomNumberButton(
                    number: '1',
                    onTap: () => addAmmount('1'),
                  ),
                  CustomNumberButton(
                    number: '2',
                    onTap: () => addAmmount('2'),
                  ),
                  CustomNumberButton(
                    number: '3',
                    onTap: () => addAmmount('3'),
                  ),
                  CustomNumberButton(
                    number: '4',
                    onTap: () => addAmmount('4'),
                  ),
                  CustomNumberButton(
                    number: '5',
                    onTap: () => addAmmount('5'),
                  ),
                  CustomNumberButton(
                    number: '6',
                    onTap: () => addAmmount('6'),
                  ),
                  CustomNumberButton(
                    number: '7',
                    onTap: () => addAmmount('7'),
                  ),
                  CustomNumberButton(
                    number: '8',
                    onTap: () => addAmmount('8'),
                  ),
                  CustomNumberButton(
                    number: '9',
                    onTap: () => addAmmount('9'),
                  ),
                  const SizedBox(
                    width: 60,
                    height: 60,
                  ),
                  CustomNumberButton(
                    number: '0',
                    onTap: () => addAmmount('0'),
                  ),
                  GestureDetector(
                    onTap: () => deleteAmmount(),
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: numberBackgroundColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              50.heightBox,
              CustomFilledButton(
                title: 'Checkout Now',
                onPressed: () async {
                  final int ammount = int.parse(
                    amountC.text.replaceAll('.', '').replaceAll('Rp', ''),
                  );

                  if (ammount == 0) {
                    showCustomSnackbar(
                        context, 'Silahkan masukkan jumlah yang valid');
                  } else {
                    goToTransfer();
                  }
                },
              ),
              25.heightBox,
              CustomTextButton(
                title: 'Terms & Conditions',
                onPressed: () {},
              ),
              40.heightBox,
            ],
          );
        },
      ),
    );
  }
}
