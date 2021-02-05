import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasscodeWidget extends StatefulWidget {
  const PasscodeWidget({
    Key key,
    this.onChanged,
  }) : super(key: key);

  final Function(String code) onChanged;

  @override
  _PasscodeWidgetState createState() => _PasscodeWidgetState();
}

class _PasscodeWidgetState extends State<PasscodeWidget> {
  List<String> parts = ['', '', '', ''];
  String code = '';
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CodeWidget(
          node: focusNode1,
          onChanged: (String value) {
            if (value.isNotEmpty) {
              setState(() {
                parts[0] = value;
              });

              focusNode2.requestFocus();
            }
          },
        ),
        CodeWidget(
          node: focusNode2,
          onChanged: (String value) {
            if (value.isNotEmpty) {
              setState(() {
                parts[1] = value;
              });

              focusNode3.requestFocus();
            } else {
              focusNode1.requestFocus();
            }
          },
        ),
        CodeWidget(
          node: focusNode3,
          onChanged: (String value) {
            if (value.isNotEmpty) {
              setState(() {
                parts[2] = value;
              });

              focusNode4.requestFocus();
            } else {
              focusNode2.requestFocus();
            }
          },
        ),
        CodeWidget(
          node: focusNode4,
          onChanged: (String value) {
            if (value.isNotEmpty) {
              setState(() {
                parts[3] = value;
                code = parts.join();
              });

              widget.onChanged(parts.join());
            } else {
              focusNode3.requestFocus();
            }
          },
        ),
      ],
    );
  }
}

class CodeWidget extends StatelessWidget {
  const CodeWidget({
    Key key,
    this.onChanged,
    this.node,
  }) : super(key: key);

  final Function(String value) onChanged;
  final FocusNode node;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.0,
      child: TextFormField(
        focusNode: node,
        onChanged: onChanged,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        style: TextStyle(
          color: Color(0xFF334148).withOpacity(0.8),
          fontFamily: 'Source Bold',
          fontSize: 14.0,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
          filled: true,
          fillColor: Color(0xFF03A69A).withOpacity(0.050),
          floatingLabelBehavior: FloatingLabelBehavior.never,
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
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 1.5,
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
