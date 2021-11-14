import 'package:flutter/material.dart';
import 'package:weight_tracker/utils/navigation/navigator.dart';
import 'package:weight_tracker/utils/styles/colour_utils.dart';


class WBackButton extends StatelessWidget {
  final VoidCallback preferredBackAction;
  final Color color;
  final Color backgroundColor;
  final Border border;

  const WBackButton(
      {Key key,
      this.preferredBackAction,
      this.color,
      this.backgroundColor,
      this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.blue,
          border: border,
          shape: BoxShape.circle
        ),
        child: Icon(
          Icons.arrow_back_rounded,
          color: color ?? blue,
          size: 20,
        ),
      ),
      onTap: preferredBackAction ??
          () {
            pop(context);
          },
    );
  }
}
