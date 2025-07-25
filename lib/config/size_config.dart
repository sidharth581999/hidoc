
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  static late bool isPortrait;
  static late bool isPhone;

  static const double phoneBreakpoint = 500;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;

    isPortrait = _mediaQueryData.orientation == Orientation.portrait;
    isPhone = screenWidth < phoneBreakpoint;
  }

  // Helpers for percentage-based size
  static double w(double percent) => blockSizeHorizontal * percent;
  static double h(double percent) => blockSizeVertical * percent;

  static double sw(double percent) => safeBlockHorizontal * percent;
  static double sh(double percent) => safeBlockVertical * percent;
}

