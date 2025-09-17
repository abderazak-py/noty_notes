import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:noty_notes/app/controllers/note_controller.dart';
import 'package:noty_notes/app/controllers/theme_controller.dart';
import 'package:noty_notes/app/models/note_model.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteController noteController = Get.find<NoteController>();
    final ThemeController themeController = Get.find<ThemeController>();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController contentController = TextEditingController();
    var currentColor = Color(0xFF2196F3).obs;
    var fontColor = themeController.fontColor(currentColor.value).obs;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 10,
              ),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'title'.tr,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
                bottom: 20,
              ),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.70,
                child: TextFormField(
                  maxLines: 33,
                  controller: contentController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: 'content'.tr,
                  ),
                ),
              ),
            ),

            Obx(
              () => Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.45,
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 12),
                          ),
                          backgroundColor: WidgetStateProperty.all(
                            currentColor.value,
                          ),
                        ),
                        onPressed: () {
                          if (titleController.text.isEmpty ||
                              contentController.text.isEmpty) {
                            Get.snackbar('erorr'.tr, 'empty_note'.tr);
                            return;
                          }
                          noteController.addNote(
                            NoteModel(
                              title: titleController.text,
                              content: contentController.text,
                              date: DateTime.now(),
                              color: currentColor.value,
                            ),
                            Get.back(),
                          );
                        },
                        child: Text(
                          'save'.tr,
                          style: TextStyle(
                            fontSize: 26,
                            color: fontColor.value,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.45,
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 12),
                          ),
                          backgroundColor: WidgetStateProperty.all(
                            currentColor.value,
                          ),
                        ),
                        onPressed: () {
                          //Color picker
                          Get.dialog(
                            AlertDialog(
                              title: Text('pick_color'.tr),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: currentColor.value,
                                  onColorChanged: (color) {
                                    currentColor.value = color;
                                    fontColor = themeController
                                        .fontColor(currentColor.value)
                                        .obs;
                                  },
                                  pickerAreaHeightPercent: 0.8,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: Text('done'.tr),
                                  onPressed: () => Get.back(),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          'color'.tr,
                          style: TextStyle(
                            fontSize: 26,
                            color: fontColor.value,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
