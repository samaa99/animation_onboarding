
import 'package:flutter/material.dart';

extension MediaQueryHelper on BuildContext {
  get width => MediaQuery.of(this).size.width;
  get height => MediaQuery.of(this).size.height;
}