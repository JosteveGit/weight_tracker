import 'package:flutter/material.dart';
import 'package:weight_tracker/utils/widgets/w_loader.dart';

void showLoader(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => WLoader(),
  );
}