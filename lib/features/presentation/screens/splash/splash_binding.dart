import 'package:etiqa_todo_mobile_app/features/presentation/screens/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => SplashController(),
      fenix: true,
    );
    Get.put(
      SplashController(),
      permanent: true,
    );
  }
}
