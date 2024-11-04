import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/core/utils/my_colors.dart';
import 'package:movie/home_or_login.dart';

import '../core/routing/routing.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key, required this.routing});

  final Routing routing;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          scaffoldBackgroundColor: MyColors.primary,
          useMaterial3: true,
        ),
        home: const HomeOrLogin(),
        // initialRoute: Routes.login,
        onGenerateRoute: routing.generateRoute,
      ),
    );
  }
}
