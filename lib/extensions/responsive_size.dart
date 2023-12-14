import 'package:flutter/material.dart';

extension ResponsiveSize on BuildContext {
  double width(double width) {
    return MediaQuery.sizeOf(this).width * (width / 430);
  }
}
