import 'package:flutter/material.dart';
import 'package:movie/app/movie_app.dart';


void main() {
  runApp(const MovieApp());
}

<<<<<<< HEAD
=======
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
>>>>>>> bfcbbd3fc95364eec4810e779087394862431211
