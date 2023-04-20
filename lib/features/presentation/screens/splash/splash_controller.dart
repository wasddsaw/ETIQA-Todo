import 'dart:async';

import 'package:etiqa_todo_mobile_app/features/presentation/screens/main/home/home_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(
      const Duration(seconds: 1),
      () {
        checkAndNavigateUser();
      },
    );
  }

  void checkAndNavigateUser() async {
    Get.offAllNamed(HomeScreen.routeName);
  }
}
