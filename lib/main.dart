import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/features/home/presentation/views/home_view.dart';

import 'core/utils/my_colors.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(374, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stream Everywhere',
        theme: ThemeData(
          scaffoldBackgroundColor: MyColors.primary,
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
