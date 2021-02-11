import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/base/base_controller.dart';
import 'package:getx_flutter/models/member.dart';
import 'package:getx_flutter/view_models/member/member_controller.dart';

/// createdby Daewu Bintara
/// Saturday, 1/30/21

class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestController());
    Get.lazyPut(() => MemberController());
  }

}

class TestController extends BaseController {
  var count = 0;
  var member = Member();

  @override
  void onInit() async {
    setEnableScrollController = true;
    super.onInit();
    await 3.delay();
    setScreenState = screenStateOk;
    update();
  }

  void increment() {
    count++;
    update();
  }

  void entryMember() {
    member = Member(
        id: 1,
        name: "Daewu BP"
    );
    update();
  }

  void onGetMember() async {
    showLoadingDialog();
    var res = await getDataMember();
    hideDialog();
    showSnackBar(title: "Response",  message: res.body.toString());
  }

  void showAlertDialog() {
    showAlert(
        title: "Haloo",
        content: Text("Halo this is content"),
        barrierDismissible: false,
        confirmTextColor: Colors.white,
        textConfirm: "Okee",
        textCancel: "Batal",
        onWillPop: () {},
        onConfirm: (){
          hideDialog();
        },
        onCancel: (){},
        actions: [

        ]
    );
  }


  void changeTheme() {
    if (Get.isDarkMode) {
      AppThemes().changeThemeMode(ThemeMode.light);
    } else {
      AppThemes().changeThemeMode(ThemeMode.dark);
    }
  }
}