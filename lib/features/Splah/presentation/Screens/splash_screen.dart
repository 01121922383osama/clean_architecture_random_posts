import '../../../../Config/routes/app_routes.dart';
import '../../../../Core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.randomeqoute, (route) => false);
      },
    );
    return Scaffold(
      body: Center(
        child: Image.asset(ImgAssets.qoute),
      ),
    );
  }
}
