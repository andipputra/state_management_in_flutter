import 'package:day_21_state_management/presentation/binding/province_binding/province_binding.dart';
import 'package:day_21_state_management/presentation/pages/home/home_page.dart';
import 'package:day_21_state_management/presentation/pages/province/province_page.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = MyHomePage.routeName;

  static final routes = [
    GetPage(
      name: MyHomePage.routeName,
      page: () => MyHomePage(title: 'Flutter Demo Home Page'),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: ProvincePage.routeName,
      page: () => const ProvincePage(),
      binding: ProvinceBinding(),
      transition: Transition.circularReveal,
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}
