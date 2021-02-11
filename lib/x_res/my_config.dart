import 'package:flutter/material.dart';

/// createdby Daewu Bintara
/// Monday, 1/4/21

/// CONFIGS DATA
class MyConfig {
  /// APP CONFIG
  static final String APP_NAME = "-- FLUTTER BASE APP --";
  static final String BASE_URL = "https://yourdomain.com/";
  static final String TOKEN_STRING_KEY = 'TOKEN_STRING_KEY';
  static final String EMAIL_KEY = 'EMAIL_KEY';
  static final String FCM_TOKEN_KEY = 'EMAIL_KEY';

  /// CUSTOM CONFIG APP
  static final String LANGUAGE = 'LANGUAGE';

}

/// SPACINGS DATA
class MySpace {
  /// Padding
  static final double paddingZero = 0.0;
  static final double paddingXS = 2.0;
  static final double paddingS = 4.0;
  static final double paddingM = 8.0;
  static final double paddingL = 16.0;
  static final double paddingXL = 32.0;
  static final double paddingXXL = 36.0;

  /// Margin
  static final double marginZero = 0.0;
  static final double marginXS = 2.0;
  static final double marginS = 4.0;
  static final double marginM = 8.0;
  static final double marginL = 16.0;
  static final double marginXL = 32.0;

  /// Spacing
  static final double spaceXS = 2.0;
  static final double spaceS = 4.0;
  static final double spaceM = 8.0;
  static final double spaceL = 16.0;
  static final double spaceXL = 32.0;
}

/// COLORS DATA
class MyColor {
  /// Common Colors
  static final PRIMARY_COLOR =  Color(0xFF250048);
  static final MISTY_COLOR =  Color(0xFFE0E0E0);
  static final Color LIGHT_BACKGROUND_COLOR = Color(0xFFF9F9F9);
  static final ACCENT_COLOR =  Color(0xFF9B51E0);
  static final PRIMARY_VARIANT =  Color(0xFF9B51E0);
  static final PRIMARY_VARIANT_LIGHT =  Color(0xFFE8F5E9);
  static final PRIMARY_SWATCH =  Color(0xFF3681EC);

  static final ICON_COLOR = Colors.white;
  static final TEXT_COLOR =  Color(0xFF000000);
  static final BUTTON_COLOR =  PRIMARY_COLOR;
  static final TEXT_BUTTON_COLOR =  Colors.white;

  static final PRIMARY_DARK_COLOR =  Color(0xFF250048);
  static final Color DARK_BACKGROUND_COLOR = Color(0xFF000000);
  static final ICON_COLOR_DARK = Colors.white;
  static final TEXT_COLOR_DARK =  Color(0xFFffffff);
  static final BUTTON_COLOR_DARK =  PRIMARY_DARK_COLOR;
  static final TEXT_BUTTON_COLOR_DARK =  Colors.black;

}