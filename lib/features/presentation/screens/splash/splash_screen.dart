import 'package:etiqa_todo_mobile_app/features/presentation/screens/splash/splash_controller.dart';
import 'package:etiqa_todo_mobile_app/features/presentation/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(),
    );
  }
}
