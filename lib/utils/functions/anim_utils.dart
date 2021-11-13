import 'dart:math';

import 'package:flutter/material.dart';

double dToR(double degrees) {
  return degrees * (pi / 180);
}

double getAnimValue({double start, double end, Animation animation}) {
  return ((end - start) * animation.value) + start;
}
