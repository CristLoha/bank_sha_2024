import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/shared/box_extension.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/icon_string.dart';
import '../../../shared/img_string.dart';
import '../../../shared/theme.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/profile_menu_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> goToEditPin() async {
    if (await Navigator.pushNamed(context, '/pin') == true) {
      if (mounted) {
        Navigator.pushNamed(context, '/profile-edit-pin');
      }
    }
  }

  Future<void> goToEditProfile() async {
    if (await Navigator.pushNamed(context, '/pin') == true) {
      if (mounted) {
        Navigator.pushNamed(context, '/profile-edit');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/sign-in',
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is AuthSuccess) {
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                20.heightBox,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 22,
                  ),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: state.user.profilePicture == null
                                    ? const AssetImage(ImgString.profile)
                                    : NetworkImage(
                                        state.user.profilePicture!,
                                      ) as ImageProvider,
                              ),
                            ),
                          ),
                          if (state.user.verified == 1)
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: whiteColor,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.check_circle,
                                    color: greenColor,
                                    size: 24.w,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      16.heightBox,
                      Text(
                        state.user.name.toString(),
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      40.heightBox,
                      ProfileMenuItem(
                        iconUrl: IconString.editProfile,
                        title: 'Edit Profile',
                        onTap: () => goToEditProfile(),
                      ),
                      ProfileMenuItem(
                        iconUrl: IconString.pin,
                        title: 'My PIN',
                        onTap: () => goToEditPin(),
                      ),
                      ProfileMenuItem(
                        iconUrl: IconString.wallet,
                        title: 'Wallet Settings',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconUrl: IconString.reward,
                        title: 'My Rewards',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconUrl: IconString.help,
                        title: 'Help Center',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        iconUrl: IconString.logOut,
                        title: 'Log Out',
                        onTap: () {
                          context.read<AuthBloc>().add(AuthLogout());
                        },
                      ),
                    ],
                  ),
                ),
                87.heightBox,
                CustomTextButton(
                  title: 'Report a Problem',
                  onPressed: () {},
                ),
                50.heightBox,
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
