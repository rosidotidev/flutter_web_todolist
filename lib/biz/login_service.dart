import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:todoweb/common/secrets.dart';

import 'todolist_controller.dart';

class LoginService {
  static LoginService _sing = LoginService._internal();
  static LoginService sing() => _sing;
  LoginService._internal();

  Future<Map<String, dynamic>> login(String username) async {
    var client = dio.Dio();
    client.options.headers['content-Type'] = 'application/json';
    client.options.headers["X-Require-Whisk-Auth"] = NIM_SECRET_KEY;
    dio.Response<String> response = await client.post(
        NIM_SECRET_URL + '/api/user-access',
        data: {"username": username});
    print('useracces response.data1 ' + response.data);
    //res = response.data["response"]["ok"];
    Map<String, dynamic> res = jsonDecode(response.data);
    res = res["response"];
    print('useracces response.data2 ' + response.data.toString());
    TodolistController tdlc = Get.find();
    tdlc.user = res["code"];
    //print('useracces response2' + response.data));
    return res;
  }
}
