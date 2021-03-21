import 'package:get/get.dart';

import 'login_service.dart';

class LoginController extends GetxController {
  var sUser = ''.obs;
  String userCode = '';

  Future<String> login() async {
    String result = "RES_NO_OK";
    Map<String, dynamic> res;
    res = await LoginService.sing().login(sUser.value);
    if (res["result"] == 'ok') {
      result = "RES_OK";
      userCode = res["code"];
    }
    return result;
  }

  Future<String> clean() async {
    String res = "OK";
    sUser.value = '';
    userCode = '';
    return res;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
