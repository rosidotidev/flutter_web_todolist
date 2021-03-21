import 'package:flutter/material.dart';

class SmartInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final double width;
  String text;
  bool obfuscated;
  bool multiline;
  bool enabled;
  bool isNumber;
  Function onTap;
  SmartInputField(
      {Key key,
      this.obfuscated = false,
      this.hintText,
      this.multiline = false,
      this.text = '',
      this.icon = Icons.comment_rounded,
      this.onChanged,
      this.onTap,
      this.isNumber = false,
      this.enabled = true,
      this.width = 0.8})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!this.multiline) {
      return _buildDefault(context);
    } else {
      return _buildMultiline(context);
    }
  }

  Widget _buildDefault(BuildContext context) {
    return TextField(
      //labelText: '';
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      ),
      keyboardType: this.isNumber
          ? TextInputType.numberWithOptions(decimal: false)
          : TextInputType.text,
      enabled: this.enabled,
      onTap: onTap != null ? onTap : () {},
      obscureText: obfuscated,
      onChanged: onChanged,
      controller: TextEditingController()..text = text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
        fillColor: Colors.white,
        filled: true,
        //hintText: hintText,
        labelText: hintText,
        prefixIcon: Icon(
          icon,
          size: 60.0,
        ),
      ),
    );
  }

  Widget _buildMultiline(BuildContext context) {
    return TextField(
      //labelText: '';
      enabled: this.enabled,
      onTap: onTap != null ? onTap : () {},
      keyboardType: TextInputType.multiline,
      minLines: 2,
      maxLines: null,
      obscureText: obfuscated,
      onChanged: onChanged,
      controller: TextEditingController()..text = text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
        fillColor: Colors.white,
        filled: true,
        //hintText: hintText,
        labelText: hintText,
        prefixIcon: Icon(
          icon,
          size: 30.0,
        ),
      ),
    );
  }
}
