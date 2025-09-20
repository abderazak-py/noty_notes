import 'package:get/get.dart';
import 'package:noty_notes/app/services/Language_service.dart';

class LanguageController extends GetxController {
  final LanguageService languageService = Get.find<LanguageService>();

  void changeLanguage(String langCode) {
    languageService.changeLanguage(langCode);
  }

  void loadLanguage() {
    languageService.loadLanguage();
  }
}
