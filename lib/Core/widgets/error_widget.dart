import 'package:clean_architecture/Core/utils/app_colors.dart';
import 'package:clean_architecture/Core/utils/media_query_value.dart';
import 'package:flutter/material.dart';

import '../../Config/locale/app_localizations.dart';

class ErrorWidgetPage extends StatelessWidget {
  final void Function()? onPressed;
  const ErrorWidgetPage({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_rounded,
            color: AppColors.primaryColor,
            size: 150,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              AppLocalizations.of(context)!.translate('something_went_wrong')!,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.translate('try_again')!,
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.hint,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            height: 55,
            width: context.width * 0.55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: onPressed,
              child: Text(
                  AppLocalizations.of(context)!.translate('reload_screen')!),
            ),
          ),
        ],
      ),
    );
  }
}
