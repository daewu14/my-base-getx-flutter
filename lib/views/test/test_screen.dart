import 'package:flutter/material.dart';
import 'package:getx_flutter/base/base_view_view_model.dart';
import 'package:getx_flutter/view_models/member/member_widget.dart';
import 'package:getx_flutter/x_res/my_res.dart';

import 'test_binding.dart';

/// createdby Daewu Bintara
/// Friday, 1/29/21

// ignore: must_be_immutable
class TestScreen extends BaseView<TestController> {
  @override
  Widget vBuilder() => Scaffold(
      appBar: AppBar(title: Text("${XR().string.test_screen}")),
      // body: AnimatedSwitcher(
      //   duration: Duration(milliseconds: 500),
      //   child: _body(),
      // ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        onPressed: controller.increment,
      )
  );

  _body() {
    if (controller.screenStateIsLoading)
      return Center(child: CircularProgressIndicator());

    if (controller.screenStateIsError)
      return Text(XR().string.error_message);

    if (controller.screenStateIsOK)
      return Center(
        key: UniqueKey(),
        child: ListView(
          children: [
            Text("${controller.count}"),
            controller.member.id == null
                ? Text("${controller.count}")
                : Text("${controller.member?.name}"),
            FlatButton(
              child: Text("Member",
                style: AppThemes().general().textTheme.bodyText1,
              ),
              onPressed: (){
                controller.entryMember();
              },
            ),
            FlatButton(
              child: Text("Show Snackbar"),
              onPressed: (){
                controller.showSuccessSnackBar(
                    title: "Haloo",
                    message: "Pesan dari snackbar test_controller");
              },
            ),
            FlatButton(
              child: Text("Show Simple Snackbar"),
              onPressed: (){
                controller.showSimpleSuccessSnackBar(message: "Halo snackbar...");
              },
            ),
            FlatButton(
              child: Text("CALL API MEMBER"),
              onPressed: controller.onGetMember,
            ),
            FlatButton(
              child: Text("Show Alert"),
              onPressed: controller.showAlertDialog,
            ),
            MemberWidget(),
            Divider(color: Colors.grey),
            FlatButton(
              child: Text("${XR().string.change_theme}"),
              onPressed: controller.changeTheme,
            )
          ],
        ),
      );
  }

}
