import 'package:etiqa_todo_mobile_app/features/presentation/screens/main/form/form_binding.dart';
import 'package:etiqa_todo_mobile_app/features/presentation/screens/main/form/form_screen.dart';
import 'package:etiqa_todo_mobile_app/features/presentation/screens/main/home/home_binding.dart';
import 'package:etiqa_todo_mobile_app/features/presentation/screens/main/home/home_screen.dart';
import 'package:etiqa_todo_mobile_app/features/presentation/screens/splash/splash_binding.dart';
import 'package:etiqa_todo_mobile_app/features/presentation/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const initial = SplashScreen.routeName;

  static List<GetPage> pages() {
    return [
      GetPage(
        name: SplashScreen.routeName,
        page: () => const SplashScreen(),
        binding: SplashBinding(),
      ),
      GetPage(
        name: HomeScreen.routeName,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
      ),
      GetPage(
        name: FormScreen.routeName,
        page: () => const FormScreen(),
        binding: FormBinding(),
      ),
    ];
  }
}
