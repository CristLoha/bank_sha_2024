import 'package:bank_sha/blocs/bloc/auth_bloc.dart';
import 'package:bank_sha/models/sign_in_form_model.dart';
import 'package:flutter/material.dart';
import 'package:bank_sha/shared/box_extension.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/custom_text_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/shared_methods.dart';
import '../../widgets/custom_filled_button.dart';
import '../../widgets/custom_image_logo.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_title_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailC = TextEditingController(text: '');
  final passC = TextEditingController(text: '');

  bool validate() {
    if (emailC.text.isEmpty || passC.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const CustomImageLogo(),
              const CustomTitlePage(title: 'Sign In &\nGrow Your Financeh'),
              30.heightBox,
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadiusDirectional.circular(
                    20,
                  ),
                ),
                child: Column(
                  children: [
                    CustomTextFormField(
                      title: 'Email',
                      controller: emailC,
                    ),
                    16.heightBox,
                    CustomTextFormField(
                      title: 'Password',
                      obscureText: true,
                      controller: passC,
                    ),
                    8.heightBox,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password',
                        style: blueTextStyle,
                      ),
                    ),
                    30.heightBox,
                    CustomFilledButton(
                      title: 'Sign In',
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthLogin(
                                  SignInFormModel(
                                    email: emailC.text,
                                    password: passC.text,
                                  ),
                                ),
                              );
                        } else {
                          showCustomSnackbar(context, 'Semua fiel harus diisi');
                        }
                      },
                    ),
                  ],
                ),
              ),
              50.heightBox,
              CustomTextButton(
                title: 'Create New Account',
                onPressed: () => Navigator.pushNamed(context, '/sign-up'),
              ),
              58.heightBox,
            ],
          );
        },
      ),
    );
  }
}
