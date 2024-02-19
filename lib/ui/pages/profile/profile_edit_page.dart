import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/models/user_edit_form_model.dart';
import 'package:bank_sha/shared/box_extension.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/ui/widgets/custom_filled_button.dart';
import 'package:bank_sha/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/theme.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final usernameC = TextEditingController();
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  late String initialUsername;
  late String initialName;
  late String initialEmail;
  late String initialPassword;

  final bool _isInit = false;
  bool _isDataChanged = false;
  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      initialUsername = authState.user.username!;
      initialName = authState.user.name!;
      initialEmail = authState.user.email!;
      initialPassword = authState.user.password!;
      usernameC.text = initialUsername;
      nameC.text = initialName;
      emailC.text = initialEmail;
      passwordC.text = initialPassword;

      _checkDataChanged();
    }
  }

  void _checkDataChanged() {
    if (!_isInit) {
      setState(() {
        _isDataChanged = (usernameC.text != initialUsername ||
            nameC.text != initialName ||
            emailC.text != initialEmail ||
            passwordC.text != initialPassword);
      });
    }
  }

  bool _isDataValid() {
    return usernameC.text.isNotEmpty &&
        nameC.text.isNotEmpty &&
        emailC.text.isNotEmpty &&
        passwordC.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            initialUsername = state.user.username!;
            initialName = state.user.name!;
            initialEmail = state.user.email!;
            initialPassword = state.user.password!;
            usernameC.text = initialUsername;
            nameC.text = initialName;
            emailC.text = initialEmail;
            passwordC.text = initialPassword;

            _checkDataChanged();

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
                      title: 'Username',
                      obscureText: false,
                      controller: usernameC,
                      onChanged: (_) => _checkDataChanged(),
                    ),
                    16.heightBox,
                    CustomTextFormField(
                      title: 'Full Name',
                      obscureText: false,
                      controller: nameC,
                      onChanged: (_) => _checkDataChanged(),
                    ),
                    16.heightBox,
                    CustomTextFormField(
                      title: 'Email Address',
                      obscureText: false,
                      controller: emailC,
                      onChanged: (_) => _checkDataChanged(),
                    ),
                    16.heightBox,
                    CustomTextFormField(
                      title: 'Password',
                      obscureText: true,
                      controller: passwordC,
                      onChanged: (_) => _checkDataChanged(),
                    ),
                    30.heightBox,
                    CustomFilledButton(
                      title: 'Update Now',
                      onPressed: _isDataChanged && _isDataValid()
                          ? () {
                              context.read<AuthBloc>().add(
                                    AuthUpdateUser(
                                      UserEditFormModel(
                                        username: usernameC.text,
                                        name: nameC.text,
                                        email: emailC.text,
                                        password: passwordC.text,
                                      ),
                                    ),
                                  );
                            }
                          : null,
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
}
