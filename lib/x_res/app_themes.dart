import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'my_res.dart';


/// Created by daewubintara on
/// 08, September 2020 16.17

class AppThemes {
  final String _sThemeModeKey = 'S_THEME_MODE_KEY';
  final String _sThemeModeLight = '_sThemeModeLight';
  final String _sThemeModeDark = '_sThemeModeDark';
  static String Poppins = "Poppins";
  static String Roboto = "Roboto";
  static String QuicksandRegular = "QuicksandRegular";
  static String QuicksandMedium = "QuicksandMedium";

  static String _fontFamily = QuicksandMedium;

  // LIGHT THEME TEXT
  static final TextTheme _lightTextTheme = TextTheme(
    overline: TextStyle(
      color: MyColor.TEXT_COLOR,
      fontFamily: _fontFamily
    ),
    headline1: TextStyle(fontSize: 20.0, fontFamily: _fontFamily),
    bodyText1: TextStyle(fontSize: 16.0, fontFamily: _fontFamily),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: _fontFamily),
    button: TextStyle(fontSize: 15.0, fontFamily: _fontFamily),
    headline6: TextStyle(fontSize: 16.0, fontFamily: _fontFamily),
    subtitle1: TextStyle(fontSize: 16.0, fontFamily: _fontFamily),
    caption: TextStyle(fontSize: 12.0, fontFamily: _fontFamily),
  );

  // DARK THEME TEXT
  static final TextTheme _darkTextTheme = TextTheme(
    overline: TextStyle(
        color: MyColor.TEXT_COLOR_DARK,
        fontFamily: _fontFamily
    ),
    headline1: TextStyle(fontSize: 20.0, fontFamily: _fontFamily),
    bodyText1: TextStyle(fontSize: 16.0, fontFamily: _fontFamily),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: _fontFamily),
    button: TextStyle(fontSize: 15.0, fontFamily: _fontFamily),
    headline6: TextStyle(fontSize: 16.0, fontFamily: _fontFamily),
    subtitle1: TextStyle(fontSize: 16.0, fontFamily: _fontFamily),
    caption: TextStyle(fontSize: 12.0, fontFamily: _fontFamily),
  );

  // LIGHT THEME
  static final ThemeData _lightTheme = ThemeData(
    fontFamily: _fontFamily,
    primaryColor: MyColor.PRIMARY_COLOR,
    accentColor: MyColor.ACCENT_COLOR,
    scaffoldBackgroundColor: MyColor.LIGHT_BACKGROUND_COLOR,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: MyColor.PRIMARY_COLOR,
    ),
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: MyColor.PRIMARY_COLOR,
      iconTheme: IconThemeData(color: MyColor.ICON_COLOR),
    ),
    colorScheme: ColorScheme.light(
      primary: MyColor.PRIMARY_COLOR,
      primaryVariant: MyColor.PRIMARY_VARIANT,
    ),
    snackBarTheme:
    SnackBarThemeData(backgroundColor: MyColor.LIGHT_BACKGROUND_COLOR),
    iconTheme: IconThemeData(
      color: MyColor.ICON_COLOR,
    ),
    popupMenuTheme: PopupMenuThemeData(color: MyColor.LIGHT_BACKGROUND_COLOR),
    textTheme: _lightTextTheme,
  );

  // DARK THEME
  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: _fontFamily,
    primaryColor: MyColor.PRIMARY_DARK_COLOR,
    accentColor: MyColor.ACCENT_COLOR,
    scaffoldBackgroundColor: MyColor.DARK_BACKGROUND_COLOR,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: MyColor.PRIMARY_DARK_COLOR,
    ),
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      color: MyColor.PRIMARY_DARK_COLOR,
      iconTheme: IconThemeData(color: MyColor.ICON_COLOR_DARK),
    ),
    colorScheme: ColorScheme.dark(
      primary: MyColor.PRIMARY_DARK_COLOR,
      primaryVariant: MyColor.PRIMARY_VARIANT,
    ),
    snackBarTheme:
    SnackBarThemeData(backgroundColor: MyColor.DARK_BACKGROUND_COLOR),
    iconTheme: IconThemeData(
      color: MyColor.ICON_COLOR_DARK,
    ),
    popupMenuTheme: PopupMenuThemeData(color: MyColor.DARK_BACKGROUND_COLOR),
    textTheme: _darkTextTheme,
  );

  /// LIGHT THEME
  static ThemeData theme(){
    return _lightTheme;
  }

  /// DARK THEME
  static ThemeData darktheme() {
    return _darkTheme;
  }

  ///
  /// [AppThemes] initiation.
  /// Please Add [AppThemes().init() into GetMaterialApp.
  ///
  /// [Example] :
  ///
  /// GetMaterialApp(
  ///   themeMode: AppThemes().init(),
  /// )
  ///
  /// This [Function] works to initialize what theme is used.
  ThemeMode init() {
    final box = GetStorage();
    String tm = box.read(_sThemeModeKey);
    if (tm == null) {
      box.write(_sThemeModeKey, _sThemeModeLight);
      return ThemeMode.light;
    } else if (tm == _sThemeModeLight) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

  void changeThemeMode(ThemeMode themeMode) {
    final box = GetStorage();
    if (themeMode == ThemeMode.dark) {
      box.write(_sThemeModeKey, _sThemeModeDark);
    } else {
      box.write(_sThemeModeKey, _sThemeModeLight);
    }
    Get.changeThemeMode(themeMode);
    Get.rootController.themeMode.reactive;
  }

  ///
  /// [ThemeData] general.
  ///
  /// [Example] :
  ///
  /// Text("Hello, world",
  ///   style: AppThemes().general().textTheme.bodyText1,
  /// )
  ///
  /// This [Function] is useful for styling widgets.
  ///
  /// [Function] AppThemes().general().*
  /// has several derivative functions.
  ThemeData general() {
    final box = GetStorage();
    String tm = box.read(_sThemeModeKey);
    if (tm == _sThemeModeLight) {
      return _lightTheme;
    }
    return _darkTheme;
  }

}