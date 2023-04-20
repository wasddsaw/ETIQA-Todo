import 'package:etiqa_todo_mobile_app/features/presentation/screens/main/form/form_controller.dart';
import 'package:get/get.dart';

class FormBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => FormController(),
    );
  }
}
