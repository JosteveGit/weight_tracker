import 'package:flutter/material.dart';
import 'package:weight_tracker/utils/styles/colour_utils.dart';

class CustomButton extends StatelessWidget {
  final bool expanded;
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final Color textColor;
  final EdgeInsets padding;
  final bool Function() validator;
  final double width;

  const CustomButton({
    Key key,
    this.expanded = false,
    @required this.text,
    this.color,
    @required this.onPressed,
    this.textColor,
    this.padding,
    this.validator,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? (expanded ? double.maxFinite : null),
      child: ElevatedButton(
        onPressed: (validator == null ? true : validator()) ? onPressed : null,
        child: Text(
          "$text",
          style: TextStyle(
            color: textColor ?? white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            letterSpacing: 0.5,
          ),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          ),
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: (validator == null ? true : validator())
              ? MaterialStateProperty.all(color ?? blue)
              : MaterialStateProperty.all((color ?? blue).withOpacity(0.5)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}


