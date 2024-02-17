import 'package:bank_sha/blocs/bloc/auth_bloc.dart';
import 'package:bank_sha/shared/box_extension.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/ui/widgets/custom_filled_button.dart';
import 'package:bank_sha/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/theme.dart';

class ProfileEditPinPage extends StatefulWidget {
  const ProfileEditPinPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPinPage> createState() => _ProfileEditPinPageState();
}

class _ProfileEditPinPageState extends State<ProfileEditPinPage> {
  final oldPinC = TextEditingController();
  final newPinC = TextEditingController();
  late String oldPin;
  late String newPin;
  bool _isDataChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit PIN'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile-edit-success', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            children: [
              30.heightBox,
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      title: 'Old PIN',
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      controller: oldPinC,
                      onChanged: (_) => _checkDataChanged(),
                    ),
                    16.heightBox,
                    CustomTextFormField(
                      title: 'New Pin',
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      controller: newPinC,
                      onChanged: (_) => _checkDataChanged(),
                    ),
                    30.heightBox,
                    CustomFilledButton(
                      title: 'Update Now',
                      onPressed: _isDataChanged ? _updatePin : null,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _checkDataChanged() {
    setState(() {
      oldPin = oldPinC.text;
      newPin = newPinC.text;
      _isDataChanged =
          oldPin.length == 6 && newPin.length == 6 && oldPin != newPin;
    });
  }

  void _updatePin() {
    context.read<AuthBloc>().add(AuthUpdatePin(oldPin, newPin));
  }
}
