import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/shared_methods.dart';
import '../../../shared/theme.dart';
import '../../widgets/custom_number_button.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinController = TextEditingController(text: '');

  addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }

    if (pinController.text.length == 6) {
      if (pinController.text == '123456') {
        Navigator.pop(context, true);
      } else {
        showCustomSnackbar(
            context, 'PIN yang anda masukkan salah. Silakan coba lagi.');
      }
    }
  }

  deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 58),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sha PIN',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: medium,
                  ),
                ),
                72.heightBox,
                SizedBox(
                  width: 200.w,
                  child: TextFormField(
                    controller: pinController,
                    obscureText: true,
                    cursorColor: greyColor,
                    obscuringCharacter: '*',
                    enabled: false,
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                      letterSpacing: 16,
                    ),
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: greyColor,
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
                      onTap: () => addPin('1'),
                    ),
                    CustomNumberButton(
                      number: '2',
                      onTap: () => addPin('2'),
                    ),
                    CustomNumberButton(
                      number: '3',
                      onTap: () => addPin('3'),
                    ),
                    CustomNumberButton(
                      number: '4',
                      onTap: () => addPin('4'),
                    ),
                    CustomNumberButton(
                      number: '5',
                      onTap: () => addPin('5'),
                    ),
                    CustomNumberButton(
                      number: '6',
                      onTap: () => addPin('6'),
                    ),
                    CustomNumberButton(
                      number: '7',
                      onTap: () => addPin('7'),
                    ),
                    CustomNumberButton(
                      number: '8',
                      onTap: () => addPin('8'),
                    ),
                    CustomNumberButton(
                      number: '9',
                      onTap: () => addPin('9'),
                    ),
                    const SizedBox(
                      width: 60,
                      height: 60,
                    ),
                    CustomNumberButton(
                      number: '0',
                      onTap: () => addPin('0'),
                    ),
                    GestureDetector(
                      onTap: () => deletePin(),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
