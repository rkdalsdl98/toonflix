import 'package:flutter/material.dart';

import 'System.dart';

const standardDeviceWidth = 480;
const standardDeviceHeight = 600;

double scaleWidth(BuildContext context) {
  final diff = MediaQuery.of(context).size.width / standardDeviceWidth;
  return diff;
}

double scaleHeightExceptMeunbar(BuildContext context) {
  final diff = (MediaQuery.of(context).size.height - preferredAppBarHeight) /
      standardDeviceHeight;
  return diff;
}

double scaleHeight(BuildContext context) {
  final diff = (MediaQuery.of(context).size.height -
          preferredAppBarHeight -
          preferredBottomMenubarHeight) /
      standardDeviceHeight;
  return diff;
}

double scaleHeightByDevice(BuildContext context, double scale) {
  final deviceHeight = MediaQuery.of(context).size.height;
  final widgetPaddingTop = MediaQuery.of(context).padding.top;
  return (deviceHeight - preferredAppBarHeight - widgetPaddingTop) * scale;
}
