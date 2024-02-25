import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/data_plan/data_plan_bloc.dart';
import 'package:bank_sha/blocs/topup/topup_bloc.dart';
import 'package:bank_sha/blocs/transfer/transfer_bloc.dart';
import 'package:bank_sha/blocs/user/user_bloc.dart';
import 'package:bank_sha/routes/app_router.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(),
      ),
    );

// void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc()
              ..add(
                AuthGetCurrentUser(),
              ),
          ),
          BlocProvider(
            create: (context) => TopupBloc(),
          ),
          BlocProvider(create: (context) => UserBloc()),
          BlocProvider(create: (context) => TransferBloc()),
          BlocProvider(
            create: (context) => DataPlanBloc(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bank SHA',
          theme: ThemeData(
            scaffoldBackgroundColor: lightBackgroundColor,
            useMaterial3: false,
            appBarTheme: AppBarTheme(
              backgroundColor: lightBackgroundColor,
              elevation: 0,
              centerTitle: true,
              iconTheme: IconThemeData(
                color: blackColor,
              ),
              titleTextStyle: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ),
          initialRoute: '/',
          onGenerateRoute: router.onRoute,
        ),
      ),
    );
  }
}
