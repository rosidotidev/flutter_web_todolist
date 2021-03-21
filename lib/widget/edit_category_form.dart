import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todoweb/biz/todolist_controller.dart';

import 'smart_input_field.dart';

class EditCategoryForm extends StatelessWidget {
  EditCategoryForm({
    Key key,
    //this.bloc,
  }) : super(key: key);

  TodolistController tdlc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String item = tdlc.itemWidget.value;
      double h = MediaQuery.of(context).size.height;
      double w = MediaQuery.of(context).size.width;
      double hp = 20.0;
      double vp = 10.0;

      // if (w > 800) {
      //   hp = w / 3;
      // }

      return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: hp, vertical: vp),
          child: SmartInputField(
            onChanged: (description) {
              tdlc.item = description;
            },
            icon: Icons.comment_rounded,
            text: item,
            hintText: 'Description'.tr,
            width: 0.8,
          ),
        ),
        Text('')
      ]);
    });
  }
}
