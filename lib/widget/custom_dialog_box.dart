import 'dart:ui';
import '../common/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;
  final IconData icon;
  Function onTap = () {};

  CustomDialogBox(
      {Key key,
      this.title,
      this.descriptions,
      this.text,
      this.icon,
      this.onTap})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double hp = AppConstants.padding;
    if (w > 800) {
      hp = w / 3;
    }
    return Dialog(
      insetPadding: EdgeInsets.only(
        left: hp,
        //top: AppConstants.avatarRadius + AppConstants.padding,

        right: hp,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: AppConstants.padding,
              //top: AppConstants.avatarRadius + AppConstants.padding,
              top: AppConstants.padding,
              right: AppConstants.padding,
              bottom: AppConstants.padding),
          margin: EdgeInsets.only(top: AppConstants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppConstants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonTheme(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: FlatButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'No',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                    ),
                    ButtonTheme(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: FlatButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: widget.onTap,
                          child: Text(
                            widget.text,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          //left: AppConstants.padding,
          width: 60.0,
          height: 60.00,
          top: 25.00,
          //right: AppConstants.padding,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(widget.icon,
                    color: Theme.of(context).primaryColor, size: 60.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
