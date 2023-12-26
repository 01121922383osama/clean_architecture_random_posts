import '../../../../Core/utils/app_colors.dart';
import '../../domain/entities/qoute.dart';
import 'package:flutter/material.dart';

class QouteContent extends StatelessWidget {
  final Qoute qoute;
  const QouteContent({super.key, required this.qoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(22),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            qoute.content,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Container(
            margin: const EdgeInsets.all(22),
            child: Text(
              qoute.author,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
