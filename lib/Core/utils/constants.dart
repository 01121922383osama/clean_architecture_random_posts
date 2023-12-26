import 'package:clean_architecture/Core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  static void showErrorDialog(
      {required BuildContext context, required String msg}) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          msg,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
        ],
      ),
    );
  }

  static void showToast({
    required String msg,
    Color? color,
    ToastGravity? toastGravity,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: color ?? AppColors.primaryColor,
      gravity: toastGravity ?? ToastGravity.BOTTOM,
    );
  }
}
