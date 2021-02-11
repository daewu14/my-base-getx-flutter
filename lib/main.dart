import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'x_res/my_res.dart';
import 'x_routes/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemes.theme(),
      darkTheme: AppThemes.darktheme(),
      themeMode: AppThemes().init(),
      locale: MyTranslations.locale,
      fallbackLocale: MyTranslations.fallbackLocale,
      translations: MyTranslations(),
      initialRoute: RouterName.main_home,
      debugShowCheckedModeBanner: false,
      getPages: Pages.pages(),
    );
  }
}
