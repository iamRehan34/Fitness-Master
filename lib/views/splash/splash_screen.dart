import 'package:fitness_pro/constants/imageWidget.dart';
import 'package:fitness_pro/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set a timer for 3 seconds before navigating to the next screen
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.intro);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Using the AppAssets constant to load the splash image
          Center(child: Image.asset(AppAssets.splashSscrren)),
          const SizedBox(height: 20),
          const Text(
            "Welcome to the App!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
