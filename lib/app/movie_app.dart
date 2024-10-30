import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/my_colors.dart';
import 'package:movie/features/auth/presentation/views/login_view.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stream Everywhere',
        theme: ThemeData(
          scaffoldBackgroundColor: MyColors.primary,
          useMaterial3: true,
        ),
        home: const LoginView(),
      ),
    );
  }
}
