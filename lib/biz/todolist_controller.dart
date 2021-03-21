import 'package:get/get.dart';
import 'package:todoweb/biz/todolist_service.dart';
import 'package:todoweb/model/item.dart';

class TodolistController extends GetxController {
  String user = '';
  var allItems = <Item>[].obs;
  String item = '';
  var itemWidget = ''.obs;
  String mode = 'INS';
  String itemCode = '';

  Future<String> list() async {
    String result = "RES_NO_OK";
    List<Item> res;
    res = await TodolistService.sing().list(user);
    allItems.value = res;
    result = "RES_OK";
    return result;
  }

  Future<String> delete(String itemCode) async {
    String result = "RES_NO_OK";
    result = await TodolistService.sing().delete(user, itemCode);
    List<Item> res;
    res = await TodolistService.sing().list(user);
    allItems.value = res;
    return result;
  }

  Future<String> save() async {
    String result = "RES_NO_OK";
    itemWidget.value = '';

    if (mode == 'INS') {
      result = await TodolistService.sing().save(user, item);
    } else if (mode == 'UPD') {
      result = await TodolistService.sing().update(user, item, itemCode);
    }

    List<Item> res;
    res = await TodolistService.sing().list(user);
    allItems.value = res;
    mode = 'INS';
    item = '';
    itemCode = '';
    return result;
  }

  Future<String> setUpdateMode(String itemCode, String item) async {
    String result = "RES_OK";

    this.item = item;
    itemWidget.value = item;
    this.itemCode = itemCode;
    mode = 'UPD';
    print('setUpdateMode itemWidget.value ' + itemWidget.value);
    return result;
  }

  Future<String> clean() async {
    String res = "OK";

    return res;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
