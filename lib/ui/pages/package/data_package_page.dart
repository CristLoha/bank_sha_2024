import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import '../../../shared/theme.dart';
import '../../widgets/custom_filled_button.dart';
import '../../widgets/custom_form_field.dart';
import '../../widgets/package_item.dart';

class DataPackagePage extends StatefulWidget {
  const DataPackagePage({super.key});

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  @override
  Widget build(BuildContext context) {
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
          const CustomFormField(
            title: '+628',
            isShowTitle: false,
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
            children: const [
              PackageItem(
                amount: 10,
                price: 218000,
              ),
              PackageItem(
                amount: 25,
                price: 420000,
              ),
              PackageItem(
                amount: 40,
                price: 2500000,
                isSelected: true,
              ),
              PackageItem(
                amount: 99,
                price: 5000000,
              ),
            ],
          ),
          85.heightBox,
          CustomFilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                if (mounted) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/data-success', (route) => false);
                }
              }
            },
          ),
          50.heightBox,
        ],
      ),
    );
  }
}
