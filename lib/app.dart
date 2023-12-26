import 'package:clean_architecture/Config/Theme/app_theme.dart';
import 'package:clean_architecture/Config/locale/app_localizations_setup.dart';
import 'package:clean_architecture/Config/routes/app_routes.dart';
import 'package:clean_architecture/Core/utils/app_strings.dart';
import 'package:clean_architecture/features/Splah/presentation/cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart' as di;

class QouteApp extends StatelessWidget {
  const QouteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<LocaleCubit>()..getSavedLang(),
        )
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previous, current) {
          return previous != current;
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: appTheme(),
            locale: state.locale,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
          );
        },
      ),
    );
  }
}
