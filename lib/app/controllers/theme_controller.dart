import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noty_notes/app/services/theme_service.dart';

class ThemeController extends GetxController {
  final ThemeService themeService = Get.find<ThemeService>();

  void changeThemeMode() {
    themeService.switchTheme();
    update();
  }

  bool isDarkMode() {
    return themeService.loadThemeFromBox();
  }

  Color fontColor(Color noteColor) {
    return themeService.fontColor(noteColor);
  }
}
