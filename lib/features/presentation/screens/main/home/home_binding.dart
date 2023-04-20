import 'package:etiqa_todo_mobile_app/features/presentation/screens/main/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => HomeController(),
    );
    Get.put(
      HomeController(),
    );
  }
}
