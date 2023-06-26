library utile;

import 'package:flutter/material.dart';

RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(20),
);

double getDeviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getDeviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double vw(BuildContext context, double width) {
  return MediaQuery.of(context).size.width / 47 * width;
}

double vh(BuildContext context, double height) {
  return MediaQuery.of(context).size.height / 110 * height;
}

double vww(BuildContext context, double width) {
  return MediaQuery.of(context).size.width / 100 * width;
}

double vhh(BuildContext context, double height) {
  return MediaQuery.of(context).size.height / 100 * height;
}

double getLogicalPixels(BuildContext context, double physicalPixels) {
  return physicalPixels / MediaQuery.of(context).devicePixelRatio;
}
