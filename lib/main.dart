import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noty_notes/app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noty_notes/app/services/note_service.dart';
import 'package:noty_notes/app/services/theme_service.dart';
import 'package:noty_notes/app/services/translations.dart';

void main() async {
  await GetStorage.init();
  Get.put(NoteService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'app_title',
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeService().theme,
      initialRoute: '/home',
      getPages: AppPages.routes,
    );
  }
}
