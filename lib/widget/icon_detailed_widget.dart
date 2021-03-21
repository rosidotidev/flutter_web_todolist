import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoweb/biz/todolist_controller.dart';
import 'package:todoweb/widget/push_icon.dart';
import 'package:todoweb/widget/toast_x.dart';

import 'custom_dialog_box.dart';

class IconDetailedWidget extends StatelessWidget {
  IconDetailedWidget({
    Key key,
    @required this.iconColor,
    @required this.iconData,
    this.extendUI = false,
    @required this.code,
    @required this.title,
  }) : super(key: key);
  bool extendUI;
  final Color iconColor;
  final IconData iconData;

  final String code;
  final String title;

  TodolistController tdlc = Get.find();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double fontSize = 25.0;
    if (w < 600) {
      fontSize = 15.0;
    }
    return Container(
      margin: EdgeInsets.all(2.0),
      width: 200.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
        border: Border.all(
          width: 1.0,
          color: iconColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(width: 4),
          Container(
            margin: EdgeInsets.only(right: 1.0),
            width: 50.0,
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(
              icon: Icon(iconData),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {},
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Container(
                    //color: Colors.green,
                    margin: EdgeInsets.fromLTRB(4.0, 12.0, 2.0, 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          this.title,
                          style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 1.0),
                      ],
                    ),
                  ),
                ),
                _buildExtension(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExtension(BuildContext context) {
    Widget res;
    if (!this.extendUI) {
      res = Text('');
    } else {
      res = Expanded(
        flex: 2,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            width: 1,
            height: 50,
            color: Theme.of(context).disabledColor,
          ),
          PushIcon(
              icon: Icons.edit,
              iconSize: 30.0,
              color: Theme.of(context).primaryColorDark,
              onTap: () async {
                await tdlc.setUpdateMode(code, title);
              }),
          PushIcon(
              icon: Icons.delete_forever,
              iconSize: 30.0,
              color: Theme.of(context).disabledColor,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialogBox(
                          icon: Icons.delete_forever,
                          title: "Delete List",
                          descriptions:
                              "Do you want to delete".tr + " $title ?",
                          text: "Yes".tr,
                          onTap: () {
                            Navigator.of(context).pop();
                            _delteItemAndRefresh(context);
                          });
                    });
              }),
        ]),
      );
    }
    return res;
  }

  void _delteItemAndRefresh(BuildContext context) {
    tdlc.delete(code);
    ToastX.showSnackbarInfo("Item deleted", context);
  }
}
