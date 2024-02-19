import 'package:bank_sha/shared/box_extension.dart';
import 'package:bank_sha/ui/pages/transfer/components/recents_user_transfer.dart';
import 'package:flutter/material.dart';
import '../../../shared/theme.dart';
import '../../widgets/custom_filled_button.dart';
import '../../widgets/custom_form_field.dart';
import 'components/result_user_transfer.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameC = TextEditingController(text: '');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transfer',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          40.heightBox,
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          14.heightBox,
          CustomFormField(
            controller: usernameC,
            title: 'by username',
            showTitle: false,
          ),
          // const ResultsUsersTransfer(),
          RecentsUsersTransfer(),
          50.heightBox,
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(24),
        child: CustomFilledButton(
          title: 'Continue',
          onPressed: () {
            Navigator.pushNamed(context, '/transfer-amount');
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
