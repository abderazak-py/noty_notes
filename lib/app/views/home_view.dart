import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noty_notes/app/controllers/language_controller.dart';
import 'package:noty_notes/app/controllers/note_controller.dart';
import 'package:noty_notes/app/controllers/theme_controller.dart';
import 'package:noty_notes/app/views/widgets/language_menu.dart';
import 'package:noty_notes/app/views/widgets/note_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteController noteController = Get.find<NoteController>();
    final ThemeController themeController = Get.find<ThemeController>();
    final LanguageController languageController =
        Get.find<LanguageController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('app_name'.tr),
        centerTitle: true,
        actions: [
          LanguageMenu(languageController: languageController),

          GetBuilder<ThemeController>(
            builder: (_) {
              return IconButton(
                onPressed: () {
                  themeController.changeThemeMode();
                },
                icon: themeController.isDarkMode()
                    ? Icon(Icons.light_mode)
                    : Icon(Icons.dark_mode),
              );
            },
          ),
        ],
      ),

      body: Expanded(
        child: Obx(() {
          return ListView.builder(
            itemCount: noteController.sortedNotes.length,
            itemBuilder: (context, index) {
              final note = noteController.sortedNotes[index];
              return NoteCard(note: note);
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add-note'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
