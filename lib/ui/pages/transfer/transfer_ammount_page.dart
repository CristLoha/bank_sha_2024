import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../shared/shared_methods.dart';
import '../../../shared/theme.dart';
import '../../widgets/custom_filled_button.dart';
import '../../widgets/custom_number_button.dart';
import '../../widgets/custom_text_button.dart';

class TransferAmountPage extends StatefulWidget {
  const TransferAmountPage({super.key});

  @override
  State<TransferAmountPage> createState() => _TransferAmountPageState();
}

class _TransferAmountPageState extends State<TransferAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');
  @override
  void initState() {
    super.initState();
    amountController.addListener(() {
      final text = amountController.text;
      amountController.value = amountController.value.copyWith(
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
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deleteAmmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
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
                controller: amountController,
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
            physics: NeverScrollableScrollPhysics(),
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
            title: 'Continue',
            onPressed: () async {
              final int ammount = int.parse(
                amountController.text.replaceAll('.', '').replaceAll('Rp', ''),
              );

              if (ammount == 0) {
                showCustomSnackbar(
                    context, 'Silahkan masukkan jumlah yang valid');
              } else {
                if (await Navigator.pushNamed(context, '/pin') == true) {
                  if (mounted) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/transfer-success', (route) => false);
                  }
                }
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
      ),
    );
  }
}
