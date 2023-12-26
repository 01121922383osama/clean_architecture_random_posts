import '../../../../Config/locale/app_localizations.dart';
import '../../../../Core/utils/app_colors.dart';
import '../../../../Core/widgets/error_widget.dart';
import '../../../Splah/presentation/cubit/locale_cubit.dart';
import '../cubit/random_qoute_cubit.dart';
import '../widgets/qoute_content.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class QouteScreen extends StatefulWidget {
  const QouteScreen({super.key});

  @override
  State<QouteScreen> createState() => _QouteScreenState();
}

class _QouteScreenState extends State<QouteScreen> {
  Dio dio = Dio();
  @override
  void initState() {
    super.initState();
    _getRandomeQoute();
  }

  _getRandomeQoute() {
    BlocProvider.of<RandomQouteCubit>(context).getRandomeQoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (AppLocalizations.of(context)!.isEnLocale) {
                BlocProvider.of<LocaleCubit>(context).toArabic();
              } else {
                BlocProvider.of<LocaleCubit>(context).toEnglish();
              }
            },
            icon: const Icon(
              Icons.translate_outlined,
            )),
        title: Text(AppLocalizations.of(context)!.translate('app_name')!),
      ),
      body: BlocBuilder<RandomQouteCubit, RandomQouteState>(
        builder: (context, state) {
          if (state is RandomQouteIsLoading) {
            return Center(
              child: SpinKitFadingCircle(
                itemBuilder: (context, index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven
                          ? AppColors.primaryColor
                          : AppColors.hint,
                    ),
                  );
                },
              ),
            );
          } else if (state is RandomQouteError) {
            return ErrorWidgetPage(
              onPressed: () {
                _getRandomeQoute();
              },
            );
          } else if (state is RandomQouteIsLoaded) {
            return Column(
              children: [
                QouteContent(qoute: state.qoute),
                InkWell(
                  onTap: () {
                    _getRandomeQoute();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: const Icon(
                      Icons.refresh,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: SpinKitFadingCircle(
                itemBuilder: (context, index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven
                          ? AppColors.primaryColor
                          : AppColors.hint,
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
