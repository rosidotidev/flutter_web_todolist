import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:todoweb/common/secrets.dart';
import 'package:todoweb/model/item.dart';

class TodolistService {
  static TodolistService _sing = TodolistService._internal();
  static TodolistService sing() => _sing;
  TodolistService._internal();

  Future<List<Item>> list(String usercode) async {
    print('list usercode ' + usercode);
    List<Item> result = [];
    var dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["X-Require-Whisk-Auth"] = NIM_SECRET_KEY;
    Response<String> response = await dio
        .post(NIM_SECRET_URL + '/api/item-list', data: {"user-code": usercode});
    print('list response.data1 ' + response.data);
    //res = response.data["response"]["ok"];
    Map<String, dynamic> res = jsonDecode(response.data);
    res = res["response"];
    List<dynamic> list = res["items"];
    if (list.isNotEmpty) {
      list.forEach((element) {
        print("list element1 item " + element["item"]);
        print("list element2 " + element.toString());
        Item it = Item.fromJson(element);
        result.add(it);
      });
    }
    print('list list2' + list.toString());
    return result;
  }

  Future<String> delete(String usercode, String itemCode) async {
    var dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["X-Require-Whisk-Auth"] = NIM_SECRET_KEY;
    Response<String> response = await dio.post(NIM_SECRET_URL + '/api/item-del',
        data: {"user-code": usercode, "code": itemCode});
    print('del response.data1 ' + response.data);

    Map<String, dynamic> res = jsonDecode(response.data);
    res = res["response"];

    return res["result"] == "ok" ? "RES_OK" : "RES_NO_OK";
  }

  Future<String> save(String usercode, String item) async {
    var dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["X-Require-Whisk-Auth"] = NIM_SECRET_KEY;
    Response<String> response = await dio.post(
        NIM_SECRET_URL + '/api/item-save',
        data: {"user-code": usercode, "content": item});
    Map<String, dynamic> res = jsonDecode(response.data);
    res = res["response"];
    return res["result"] == "ok" ? "RES_OK" : "RES_NO_OK";
  }

  Future<String> update(String usercode, String item, String itemCode) async {
    var dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["X-Require-Whisk-Auth"] = NIM_SECRET_KEY;
    Response<String> response = await dio.post(
        NIM_SECRET_URL + '/api/item-update',
        data: {"user-code": usercode, "content": item, "code": itemCode});
    print('updated response.data1 ' + response.data);

    Map<String, dynamic> res = jsonDecode(response.data);
    res = res["response"];

    return res["result"] == "ok" ? "RES_OK" : "RES_NO_OK";
  }
}
