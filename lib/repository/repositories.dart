import 'package:getx_flutter/base/networking/api.dart';
import 'package:getx_flutter/base/networking/result.dart';

/// createdby Daewu Bintara
/// Friday, 1/29/21

///
/// --------------------------------------------
/// In this class where the [Function]s correspond to the API.
/// Which function here you will make it and you will consume it.
/// You can find and use on your Controller wich is the Controller extends [BaseController].
class Repositories {

  ApiService _service = ApiService();

  Future<Result> getDataMember() async => await _service.getData(endPoint: "test-get");


}