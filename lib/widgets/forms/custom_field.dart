import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    Key key,
    @required this.label,
    this.placeholder,
    this.helper,
    this.icon,
    this.controller,
    this.type = TextInputType.text,
    this.isPassword = false,
    this.suffix,
    this.onChanged,
  }) : super(key: key);

  final String label;
  final String placeholder;
  final String helper;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputType type;
  final Widget suffix;
  final Function(String str) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label ?? 'Label',
          style: TextStyle(
            color: Color(0xFF334148),
            fontFamily: 'Source SemiBold',
            fontSize: 14.0,
          ),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: controller ?? TextEditingController(),
          keyboardType: type,
          obscureText: isPassword,
          onSubmitted: onChanged,
          style: TextStyle(
            color: Color(0xFF334148).withOpacity(0.8),
            fontFamily: 'Source SemiBold',
            fontSize: 13.0,
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(15.0),
            filled: true,
            fillColor: Color(0xFF03A69A).withOpacity(0.050),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: Icon(
              icon ?? FlutterIcons.earth_mco,
              color: Color(0xFF334148).withOpacity(0.7),
            ),
            suffixIcon: suffix ?? SizedBox(width: 0.0),
            suffixIconConstraints: BoxConstraints(
              maxHeight: 30.0,
              minHeight: 20.0,
              minWidth: 40.0,
              maxWidth: 40.0,
            ),
            labelText: placeholder,
            labelStyle: TextStyle(
              color: Color(0xFF334148).withOpacity(0.3),
              fontFamily: 'Source SemiBold',
              fontSize: 13.0,
            ),
            helperText: helper,
            helperStyle: TextStyle(
              color: Color(0xFF334148).withOpacity(0.3),
              fontFamily: 'Source SemiBold',
              fontSize: 10.0,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 1.5,
                color: Color(0xFF03CCA7).withOpacity(0.7),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 1.5,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
