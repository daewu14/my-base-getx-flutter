import 'package:getx_flutter/base/base_controller.dart';

/// createdby Daewu Bintara
/// Thursday, 2/11/21

class ProductController extends BaseController {
  var productName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    productName.value = "Testing";
  }

}