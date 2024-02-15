import 'package:bank_sha/shared/box_extension.dart';
import 'package:bank_sha/ui/widgets/custom_pin_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../shared/theme.dart';
import '../../widgets/custom_filled_button.dart';
import '../../widgets/custom_text_button.dart';

class TopUpAmountPage extends StatefulWidget {
  const TopUpAmountPage({super.key});

  @override
  State<TopUpAmountPage> createState() => _TopUpAmountPageState();
}

class _TopUpAmountPageState extends State<TopUpAmountPage> {
  final TextEditingController ammountController =
      TextEditingController(text: '0');
  @override
  void initState() {
    super.initState();
    ammountController.addListener(() {
      final text = ammountController.text;
      ammountController.value = ammountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(int.parse(text.replaceAll('.', ''))),
      );
    });
  }

  addAmmount(String number) {
    if (ammountController.text == '0') {
      ammountController.text = '';
    }
    setState(() {
      ammountController.text = ammountController.text + number;
    });
  }

  deleteAmmount() {
    if (ammountController.text.isNotEmpty) {
      setState(() {
        ammountController.text = ammountController.text
            .substring(0, ammountController.text.length - 1);
        if (ammountController.text == '') {
          ammountController.text = '0';
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
                controller: ammountController,
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
              CustomPinButton(
                number: '1',
                onTap: () => addAmmount('1'),
              ),
              CustomPinButton(
                number: '2',
                onTap: () => addAmmount('2'),
              ),
              CustomPinButton(
                number: '3',
                onTap: () => addAmmount('3'),
              ),
              CustomPinButton(
                number: '4',
                onTap: () => addAmmount('4'),
              ),
              CustomPinButton(
                number: '5',
                onTap: () => addAmmount('5'),
              ),
              CustomPinButton(
                number: '6',
                onTap: () => addAmmount('6'),
              ),
              CustomPinButton(
                number: '7',
                onTap: () => addAmmount('7'),
              ),
              CustomPinButton(
                number: '8',
                onTap: () => addAmmount('8'),
              ),
              CustomPinButton(
                number: '9',
                onTap: () => addAmmount('9'),
              ),
              const SizedBox(
                width: 60,
                height: 60,
              ),
              CustomPinButton(
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
              if (await Navigator.pushNamed(context, '/pin') == true) {
                await launchUrl(Uri.parse('https://demo.midtrans.com/'));
                if (mounted) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/topup-success', (route) => false);
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
