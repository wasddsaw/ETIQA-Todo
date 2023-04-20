import 'package:etiqa_todo_mobile_app/features/presentation/routes/app_routes.dart';
import 'package:etiqa_todo_mobile_app/features/presentation/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await MainBinding().dependencies();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(App());
  });
}

class App extends StatelessWidget with AppRoutes {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ETIQA Mobile App',
      locale: Get.deviceLocale,
      theme: appTheme(),
      initialRoute: AppRoutes.initial,
      getPages: AppRoutes.pages(),
    );
  }
}
