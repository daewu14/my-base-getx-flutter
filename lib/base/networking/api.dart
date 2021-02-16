import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../x_utils/my_device_info.dart';
import '../../x_res/my_res.dart';
import 'result.dart';

/// createdby Daewu Bintara
/// Friday, 1/22/21

final box = GetStorage();
enum Method {
  GET, POST
}

/// This class must be instantiated in the [Repositories] class
/// core of the custom API networking
class ApiService {
  _Api _api = _Api();

  Future<Result> callManualy({
    @required Method method = Method.GET,
    @required String endPoint = "",
    Map<String, String> param,
    bool withToken = false
  }) async {
    return await _api.callManualy(method: method, endPoint: endPoint, param: param, withToken: withToken);
  }

  Future<Result> getData({@required String endPoint = "", Map<String, String> query, bool withToken = false}) async {
    return await _api.getData(endPoint: endPoint, query: query, withToken: withToken);
  }

  Future<Result> postData({@required String endPoint = "", Map data, bool withToken = false}) async {
    return await _api.postData(endPoint: endPoint, data: data, withToken: withToken);
  }

}

/// PRIVATE CLASS
/// USE THIS VIA [ApiService] class
class _Api extends GetConnect {
  String API_NAME = "api/scan/";
  Result _result = Result(
      status: false,
      isError: false,
      text: "${XR().string.error_message}"
  );

  bool _withToken = false;

  @override
  void onInit() async {
    httpClient.baseUrl = MyConfig.BASE_URL;
    String deviceId = await MyDeviceInfo().deviceID();
    String deviceName = await MyDeviceInfo().deviceName();
    String pf = Platform.operatingSystem;
    httpClient.addRequestModifier((request) {
      request.headers['platform'] = pf;
      request.headers['device-id'] = "$deviceId";
      request.headers['device-name'] = "$deviceName";
      if (_withToken){
        String token  = box.read(MyConfig.TOKEN_STRING_KEY);
        if(token!=null)request.headers['Authorization'] = "Bearer $token";
      }
      _showLogWhenDebug("HEADERS",request.headers.toString());
      return request;
    });
    super.onInit();
  }

  /// FOR NETWORKING WITH [Method.POST] / [Method.GET]
  /// RETURN DATA WITH [Result.body] MODELS and please parse with your model
  Future<Result> callManualy({
    @required Method method = Method.GET,
    @required String endPoint = "",
    Map<String, String> param,
    bool withToken = false
  }) async {
    _withToken = withToken;
    await onInit();

    _showLogWhenDebug(method == Method.GET ? "GET" : "POST",httpClient.baseUrl+API_NAME+endPoint);
    _showLogWhenDebug("PARAMS",query.toString());
    _showLogWhenDebug("TOKEN",_withToken.toString());
    try {
      var res;
      if (method == Method.GET) {
        res = await get(API_NAME+endPoint, query: param);
      } else {
        res = await post(API_NAME+endPoint, param);
      }

      if(res.isOk){
        _showLogWhenDebug("LOADED",res.bodyString);
        _result.status = true;
        _result.body = res.body;
        _showLogWhenDebug("PARSING","SUCCESS");
        return _result;
      } else {
        _showLogWhenDebug("ERROR 0",res.bodyString);
        _result.status = true;
        _result.isError = true;
        _result.text = "Terjadi kesalahan, coba beberapa saat lagi...";
        return _result;
      }
    } catch (e) {
      _showLogWhenDebug("ERROR 1",e.toString());
      _result.status = true;
      _result.isError = true;
      return _result;
    }
  }

  /// FOR NETWORKING WITH THE [Method.GET]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> getData({@required String endPoint = "", Map<String, String> query, bool withToken = false}) async {
    _withToken = withToken;
    await onInit();

    _showLogWhenDebug("GET",httpClient.baseUrl+API_NAME+endPoint);
    _showLogWhenDebug("PARAMS",query.toString());
    _showLogWhenDebug("TOKEN",_withToken.toString());
    try {

      var res = await get(API_NAME+endPoint, query: query);
      if(res.isOk){
        _showLogWhenDebug("LOADED",res.bodyString);
        _result = Result.fromJson(res.bodyString);
        _result.body = res.body;
        _showLogWhenDebug("PARSING","SUCCESS");
        return _result;
      } else {
        _showLogWhenDebug("ERROR 0",res.bodyString);
        _result.status = true;
        _result.isError = true;
        _result.text = "Terjadi kesalahan, coba beberapa saat lagi...";
        return _result;
      }
    } catch (e) {
      _showLogWhenDebug("ERROR 1",e.toString());
      _result.status = true;
      _result.isError = true;
      return _result;
    }
  }

  /// FOR NETWORKING WITH [Method.POST]
  /// RETURN DATA WITH [Result] MODEL
  Future<Result> postData({@required String endPoint = "", Map data, bool withToken = false}) async {
    _withToken = withToken;
    await onInit();

    _showLogWhenDebug("POST",httpClient.baseUrl+API_NAME+endPoint);
    _showLogWhenDebug("PARAMS",data.toString());
    _showLogWhenDebug("TOKEN",_withToken.toString());
    try {
      var res = await httpClient.post(API_NAME+endPoint,body: data);
      if(res.isOk){
        _showLogWhenDebug("LOADED",res.bodyString);
        _result = Result.fromJson(res.bodyString);
        _result.body = res.body;
        _showLogWhenDebug("PARSING","SUCCESS");
        return _result;
      } else {
        _showLogWhenDebug("ERROR 0",res.bodyString);
        _result.status = true;
        _result.isError = true;
        _result.text = "Terjadi kesalahan, coba beberapa saat lagi...";
        return _result;
      }
    } catch (e) {
      _showLogWhenDebug("ERROR 1",e.toString());
      _result.status = true;
      _result.isError = true;
      return _result;
    }
  }


  /// TO SHOW THE LOG WHEN DEBUG MODE TRUE
  _showLogWhenDebug(String status,String e){
    if (kDebugMode) log("$status => ${e.toString()}", name: MyConfig.APP_NAME);
  }

}