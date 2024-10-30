import 'package:flutter/material.dart';
import 'package:movie/core/routing/routes.dart';
import 'package:movie/features/home/presentation/views/home_view.dart';

class Routing {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeView());

      default:
        return MaterialPageRoute(builder: (context) => const NoRouteScreen());
    }
  }
}

class NoRouteScreen extends StatelessWidget {
  const NoRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No route Screen'),
      ),
    );
  }
}
