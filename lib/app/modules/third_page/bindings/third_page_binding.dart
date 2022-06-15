import 'package:get/get.dart';

import '../controllers/third_page_controller.dart';

class ThirdPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThirdPageController());
  }
}
