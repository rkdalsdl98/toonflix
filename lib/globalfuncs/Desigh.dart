import 'package:flutter/material.dart';

import 'System.dart';

const standardDeviceWidth = 480;
const standardDeviceHeight = 600;

final Map<String, Color> noticeColor = {
  'NEW': const Color(0xFF5450D3),
  '일반': const Color.fromRGBO(34, 34, 34, 1),
  '긴급': const Color(0xFFE21221),
  '이벤트': const Color.fromRGBO(104, 125, 229, 1),
};

final Map<String, Color> identifierColor = {
  'naver': const Color(0xFF00FF00),
  'kakao': Colors.yellow,
  'lezhin': Colors.red,
};

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
