import 'package:get/get.dart';
import '../modules/first_page/bindings/first_page_binding.dart';
import '../modules/first_page/views/first_page_view.dart';
import '../modules/second_page/bindings/second_page_binding.dart';
import '../modules/second_page/views/second_page_view.dart';
import '../modules/third_page/bindings/third_page_binding.dart';
import '../modules/third_page/views/third_page_view.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.firstPage,
      page: () => FirstPageView(),
      binding: FirstPageBinding(),
    ),
    GetPage(
      name: AppRoutes.secondPage,
      page: () => SecondPageView(),
      binding: SecondPageBinding(),
    ),
    GetPage(
      name: AppRoutes.thirdPage,
      page: () => ThirdPageView(),
      binding: ThirdPageBinding(),
    ),
  ];
}
