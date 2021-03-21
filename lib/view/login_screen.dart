import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoweb/biz/login_controller.dart';
import 'package:todoweb/biz/todolist_controller.dart';
import 'package:todoweb/view/todolist_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  //final LoginController ctrl = Get.find();

  LoginScreen({Key key}) : super(key: key);
  LoginController lc = Get.find();
  TodolistController tdlc = Get.find();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double hp = 20.0;
    double vp = 10.0;
    double iconDim = 250;

    if (w > 800) {
      hp = w / 3;
    } else {
      iconDim = 100;
    }
    if (w > h) {
      h = w;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: <Widget>[
                  SizedBox(height: 40),
                  Image.asset(
                    'memo_block_2.jpg',
                    height: iconDim,
                  ),
                  Text(
                    'Todo List',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: hp, vertical: vp),
                    child: TextField(
                      //controller: TextEditingController()..text = ctrl.showUSR(),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      ),
                      onChanged: (String usr) {
                        lc.sUser.value = usr;
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Username'.tr,
                        prefixIcon: Icon(
                          Icons.account_box,
                          size: 60.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  ButtonTheme(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: FlatButton(
                        minWidth: 240.0,
                        height: 45.0,
                        color: Theme.of(context).primaryColor,
                        onPressed: () async {
                          String res = '';
                          res = await lc.login();
                          if (res == "RES_OK") {
                            await tdlc.list();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) {
                                return TodolistScreen();
                              }),
                            );
                          }
                        },
                        child: Text(
                          'ENTER'.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5,
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
