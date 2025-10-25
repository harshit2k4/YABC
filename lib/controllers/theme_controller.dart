import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // track which theme is active currently
  RxBool isDark = false.obs; // default is light mode

  // theme switcher
  void changeTheme() async {
    isDark.value = !isDark.value;

    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }
}
