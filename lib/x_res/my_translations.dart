import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'my_config.dart';

/// createdby Daewu Bintara
/// Tuesday, 1/26/21

class MyTranslations extends Translations {

  // Default locale
  static final locale = Locale('id');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('en');

  static void init() {
    final box = GetStorage();
    String locale = box.read(MyConfig.LANGUAGE);
    if(locale == null) {
      Get.updateLocale(Locale('id'));
      box.write(MyConfig.LANGUAGE, 'id');
    } else {
      Get.updateLocale(Locale(locale));
    }
  }

  static void updateLocale({@required String langCode = 'id'}) {
    final box = GetStorage();
    Get.updateLocale(Locale(langCode));
    box.write(MyConfig.LANGUAGE, langCode);
  }

  @override
  Map<String, Map<String, String>> get keys => {
    'id': { // INDONESIAN
      'title_app': 'Judul Aplikasimu',
      'saya' : 'Sayaa',
      'peringatan': 'Peringatan',
      'tutup': 'Tutup',
      'reload': 'Ulangi',
      'error_message': 'Terjadi kesalahan, coba beberapa saat lagi...',
      'beranda': 'Beranda',
      'change_lang': 'Ubah Bahasa',
      'increment': 'Penambahan',
      'goto_test': 'Menuju Halaman Test',
      'test_screen': 'Halaman Test',
      'my_flutter': 'Flutter Saya',
      'change_theme': 'Ubah Tema',
    },
    'en': { // ENGLISH
      'title_app': 'Your App Title',
      'saya': 'I\'am',
      'peringatan' : 'Anouncement',
      'tutup' : 'Close',
      'reload' : 'Reload',
      'error_message': 'Something went wrong, try again later...',
      'beranda': 'Home',
      'change_lang': 'Change Language',
      'increment': 'Increment',
      'goto_test': 'Go to Test Screen',
      'test_screen': 'Test Screen',
      'my_flutter': 'My Flutter',
      'change_theme': 'Change Theme',
    }
  };
}