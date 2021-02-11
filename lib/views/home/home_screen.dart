import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/base/base_view_view_model.dart';
import 'package:getx_flutter/views/home/home_binding.dart';
import 'package:getx_flutter/x_res/my_res.dart';
import 'package:getx_flutter/x_routes/routes.dart';
import 'package:getx_flutter/x_utils/widgets/my_text_form_field.dart';

/// createdby Daewu Bintara
/// Monday, 1/4/21

class HomeScreen extends BaseView<HomeController> {

  @override
  Widget vBuilder() => Scaffold(
    appBar: AppBar(
      title: Text("${XR().string.my_flutter}"),
    ),
    body: Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${XR().string.saya}"),
            FlatButton(
              child: Text("${XR().string.goto_test}"),
              onPressed: () async {
                Get.toNamed(RouterName.test);
              },
            ),
            MyTextFormField(
              obscureText: true,
              labelText: "Testing",
              hint: "Testing...",
            )
          ],
        ),
      ),
    ),
  );
  
}
