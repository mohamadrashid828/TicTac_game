import 'package:get/get.dart';

import '../controllers/tik_tak_controller.dart';

class TikTakBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TikTakController>(
      () => TikTakController(),
    );
  }
}
