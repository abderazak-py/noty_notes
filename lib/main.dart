import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noty_notes/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noty_notes/app/services/Language_service.dart';
import 'package:noty_notes/app/services/note_service.dart';
import 'package:noty_notes/app/services/theme_service.dart';
import 'package:noty_notes/app/services/translations.dart';

void main() async {
  await GetStorage.init();
  Get.put(LanguageService());
  Get.put(NoteService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final languageService = Get.find<LanguageService>();
    final savedLang = languageService.loadLanguage();
    return GetMaterialApp(
      title: 'Noty Notes',
      translations: AppTranslations(),
      locale: Locale(savedLang!),
      fallbackLocale: const Locale('en'),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeService().theme,
      initialRoute: '/home',
      getPages: AppPages.routes,
    );
  }
}
