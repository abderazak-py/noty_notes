import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noty_notes/app/controllers/note_controller.dart';
import 'package:noty_notes/app/controllers/theme_controller.dart';
import 'package:noty_notes/app/views/widgets/note_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteController noteController = Get.find<NoteController>();
    final ThemeController themeController = Get.find<ThemeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('app_name'.tr),
        centerTitle: true,
        actions: [
          GetBuilder<ThemeController>(
            builder: (_) {
              return PopupMenuButton<String>(
                tooltip: 'language'.tr,
                icon: Icon(Icons.language),
                onSelected: (String value) {
                  switch (value) {
                    case 'ar':
                      Get.updateLocale(Locale('ar', 'AR'));
                      break;
                    case 'zh':
                      Get.updateLocale(Locale('zh', 'CN'));
                      break;
                    case 'en':
                      Get.updateLocale(Locale('en', 'US'));
                      break;
                    case 'fr':
                      Get.updateLocale(Locale('fr', 'FR'));
                      break;
                    case 'de':
                      Get.updateLocale(Locale('de', 'DE'));
                      break;
                    case 'hi':
                      Get.updateLocale(Locale('hi', 'IN'));
                      break;
                    case 'ja':
                      Get.updateLocale(Locale('ja', 'JP'));
                      break;
                    case 'pt':
                      Get.updateLocale(Locale('pt', 'PT'));
                      break;
                    case 'es':
                      Get.updateLocale(Locale('es', 'ES'));
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(value: 'ar', child: Text('arabic')),
                  PopupMenuItem<String>(value: 'en', child: Text('english')),
                  PopupMenuItem<String>(value: 'zh', child: Text('chinese')),
                  PopupMenuItem<String>(value: 'fr', child: Text('french')),
                  PopupMenuItem<String>(value: 'de', child: Text('german')),
                  PopupMenuItem<String>(value: 'hi', child: Text('hindi')),
                  PopupMenuItem<String>(value: 'ja', child: Text('japanese')),
                  PopupMenuItem<String>(value: 'pt', child: Text('portuguese')),
                  PopupMenuItem<String>(value: 'es', child: Text('spanish')),
                ],
              );
            },
          ),

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
