import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeightTextField extends StatelessWidget {
  final ValueChanged onChanged;
  final TextEditingController controller;
  const WeightTextField({
    Key key,
    this.onChanged,
    @required this.node,
    this.controller,
  }) : super(key: key);

  final FocusNode node;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: node,
      cursorWidth: 0.0,
      cursorHeight: 0.0,
      onChanged: onChanged,
      controller: controller,
      inputFormatters: [
        LengthLimitingTextInputFormatter(5),
      ],
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
        signed: false,
      ),
      textAlign: TextAlign.center,
      decoration: InputDecoration.collapsed(
        hintText: "30.2",
      ),
      style: TextStyle(
        fontSize: 100,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
