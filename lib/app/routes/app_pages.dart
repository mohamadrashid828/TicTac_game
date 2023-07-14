import 'package:get/get.dart';

import '../modules/Tik_Tak/bindings/tik_tak_binding.dart';
import '../modules/Tik_Tak/views/tik_tak_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.TikTak,
      page: () => const TikTakView(),
      binding: TikTakBinding(),
    ),
  ];
}
