import 'package:flutter/services.dart';

void setStatusBarColor({BarColor color}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarBrightness:
            color == BarColor.white ? Brightness.dark : Brightness.light),
  );
}

enum BarColor { white, black }
