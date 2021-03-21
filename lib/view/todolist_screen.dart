import 'package:flutter/material.dart';
import 'package:todoweb/biz/login_controller.dart';
import 'package:todoweb/biz/todolist_controller.dart';
import 'package:todoweb/model/item.dart';
import 'package:todoweb/widget/icon_detailed_widget.dart';
import 'package:todoweb/widget/push_icon.dart';
import 'package:todoweb/widget/toast_x.dart';

import '../widget/edit_category_form.dart';
import 'package:get/get.dart';

class TodolistScreen extends StatelessWidget {
  TodolistController tdlc = Get.find();

  _buildHeaderX(BuildContext context) {
    LoginController lc = Get.find();
    var h1 = AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Icon(
                Icons.person_rounded,
                size: 30.0,
              ),
              Text(' ${lc.sUser.value}',
                  style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ],
          ),
          _buildSaveOnBar(context),
        ],
      ),
    );
    return h1;
  }

  _buildBody(BuildContext context) {
    return Obx(() {
      List<Item> items = tdlc.allItems.value;
      List<IconDetailedWidget> cardList = [];
      int pos = 0;
      for (Item it in items) {
        pos++;
        Color c = (pos % 2 == 0)
            ? Theme.of(context).primaryColor
            : Theme.of(context).primaryColorDark;
        cardList.add(IconDetailedWidget(
          code: it.code,
          title: it.name,
          iconData: Icons.assignment,
          extendUI: true,
          iconColor: c,
        ));
      }
      double w = MediaQuery.of(context).size.width;
      double hp = 30.0;
      if (w > 800) {
        hp = w / 3;
      }
      return SingleChildScrollView(
        padding: EdgeInsets.only(left: hp, right: hp),
        child: Column(
          children: [
            EditCategoryForm(),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: cardList,
            ),
          ],
        ),
      );
    });
  }

  Widget _buildSaveOnBar(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    if (w < 600) {
      return PushIcon(
          icon: Icons.save,
          iconSize: 30.0,
          color: Colors.white,
          onTap: () async {
            tdlc.save();
            ToastX.showSnackbarInfo("Item Saved".tr, context);
          });
    } else {
      return Text('');
    }
  }

  Widget _buildSaveOnBottom(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    if (w > 600) {
      return FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColorDark,
        onPressed: () async {
          tdlc.save();
          ToastX.showSnackbarInfo("Item Saved".tr, context);
        },
        icon: Icon(Icons.save),
        label: Text("Save"),
      );
    } else {
      return Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildHeaderX(context),
      body: _buildBody(context),
      floatingActionButton: _buildSaveOnBottom(context),
    );
  }
}
