import 'package:flutter/material.dart';

const standardDeviceWidth = 480;

double scaleWidth(BuildContext context) {
  final diff = MediaQuery.of(context).size.width / standardDeviceWidth;
  return diff;
}

double scaleHeightByDevice(BuildContext context, double scale) {
  final deviceHeight = MediaQuery.of(context).size.height;
  final widgetPaddingTop = MediaQuery.of(context).padding.top;
  return (deviceHeight - 64 - widgetPaddingTop) * scale;
}
