import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/utils/app_strings.dart';
import '../../features/Splah/presentation/Screens/splash_screen.dart';
import '../../features/random_qoute/presentation/cubit/random_qoute_cubit.dart';
import '../../features/random_qoute/presentation/screens/qoute_screen.dart';
import '../../injection_container.dart' as di;

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
