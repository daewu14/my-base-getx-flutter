import 'package:get/get.dart';
import 'package:getx_flutter/base/base_controller.dart';

/// createdby Daewu Bintara
/// Wednesday, 2/10/21

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }

}

class HomeController extends BaseController {

  @override
  void onInit() {
    super.onInit();
    MyTranslations.init();
    logWhenDebug("CURRENT LANGUAGE : ", Get.locale.languageCode.toString());
  }

}