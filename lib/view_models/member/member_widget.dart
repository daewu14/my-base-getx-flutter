import 'package:flutter/material.dart';
import 'package:getx_flutter/base/base_view_view_model.dart';
import 'package:getx_flutter/view_models/member/member_controller.dart';

/// createdby Daewu Bintara
/// Saturday, 1/30/21

// ignore: must_be_immutable
class MemberWidget extends BaseViewModel<MemberController> {

  @override
  Widget vmBuilder() => Column(
    children: [
      _bodyMember(),
      FlatButton(
        child: Text("Change State Member"),
        onPressed: () {
          controller.changeState();
        },
      ),
      Divider(color: Colors.grey),
      Text("${controller.count}"),
      FlatButton(
        child: Text("${XR().string.increment}"),
        onPressed: controller.increment,
      ),
      FlatButton(
        child: Text("${XR().string.change_lang}"),
        onPressed: controller.changeLanguage,
      ),
    ],
  );

  Widget _bodyMember() {
    if (controller.wiStateIsLoading) return CircularProgressIndicator();

    if (controller.wiStateIsError) return Text("Error...");

    if (controller.wiStateIsOK) return Text("Okee...");

    return Container();
  }


}