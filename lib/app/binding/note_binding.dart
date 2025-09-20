import 'package:get/get.dart';
import 'package:noty_notes/app/controllers/language_controller.dart';
import 'package:noty_notes/app/controllers/note_controller.dart';
import 'package:noty_notes/app/controllers/theme_controller.dart';
import 'package:noty_notes/app/services/theme_service.dart';

class NoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeService>(() => ThemeService());
    Get.lazyPut<NoteController>(() => NoteController());
    Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}
