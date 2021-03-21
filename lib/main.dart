import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:todoweb/view/login_screen.dart';

import 'biz/login_controller.dart';
import 'biz/todolist_controller.dart';
import 'common/themes.dart';

void main() {
  initAll();
  runApp(TodoList());
}

class TodoList extends StatelessWidget {
  TodoList();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo List',
      debugShowCheckedModeBanner: false,
      theme: LAKERS1,
      //home: HomeUI(title: 'Memo Block'),
      home: LoginScreen(),
    );
  }
}

initAll() {
  Get.put(LoginController());
  Get.put(TodolistController());
}
