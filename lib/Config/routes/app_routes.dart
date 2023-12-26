import 'package:clean_architecture/Core/utils/app_strings.dart';
import 'package:clean_architecture/features/Splah/presentation/Screens/splash_screen.dart';
import 'package:clean_architecture/features/random_qoute/presentation/cubit/random_qoute_cubit.dart';
import 'package:clean_architecture/features/random_qoute/presentation/screens/qoute_screen.dart';
import 'package:clean_architecture/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String initRoute = '/';
  static const String randomeqoute = '/randomeqoute';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.randomeqoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => di.sl<RandomQouteCubit>(),
            child: const QouteScreen(),
          ),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text(AppStrings.noRoute),
          ),
        );
      },
    );
  }
}
