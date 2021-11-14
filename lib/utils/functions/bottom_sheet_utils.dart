import 'package:flutter/material.dart';
import 'package:weight_tracker/utils/widgets/bottom_sheets/response_bottom_sheet.dart';

Future<void> showResponseBottomSheet(
  BuildContext context, {
  @required String message,
}) async {
  await showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(34),
        topRight: Radius.circular(34),
      ),
    ),
    builder: (context) => ResponseBottomSheet(message: message),
  );
}
