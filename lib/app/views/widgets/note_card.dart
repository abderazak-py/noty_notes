import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noty_notes/app/controllers/note_controller.dart';
import 'package:noty_notes/app/controllers/theme_controller.dart';
import 'package:noty_notes/app/models/note_model.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    final NoteController noteController = Get.find<NoteController>();
    final ThemeController themeController = Get.find<ThemeController>();
    final fontColor = themeController.fontColor(note.color);
    return Card(
      color: note.color,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: fontColor,
                    ),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, // shows ... if too long
                  ),
                  SizedBox(height: 8),
                  Text(
                    note.content,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      color: fontColor,
                    ),
                    softWrap: true,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Obx(
                        () => Visibility(
                          visible: (note.isPinned.value),
                          child: Icon(
                            size: 14,
                            Icons.push_pin,
                            color: fontColor,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Text(
                        '${note.date.day}/${note.date.month}/${note.date.year}',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: fontColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // 3-dots trailing button
            PopupMenuButton<String>(
              style: ButtonStyle(
                iconColor: WidgetStateProperty.resolveWith<Color?>((
                  Set<WidgetState> states,
                ) {
                  return fontColor;
                }),
              ),
              onSelected: (String value) {
                if (value == 'pin') {
                  noteController.toggleStar(note);
                } else if (value == 'edit') {
                  Get.toNamed('/edit-note', arguments: note);
                } else {
                  Get.defaultDialog(
                    title: 'remove'.tr,
                    middleText: 'confirm_remove'.tr,
                    textCancel: 'no'.tr,
                    textConfirm: 'yes'.tr,
                    onConfirm: () {
                      noteController.removeNote(note);
                      Get.back();
                    },
                    onCancel: () {
                      Get.back();
                    },
                  );
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'pin',
                  child: (note.isPinned.value)
                      ? Text('unpin'.tr)
                      : Text('pin'.tr),
                ),
                PopupMenuItem<String>(value: 'edit', child: Text('edit'.tr)),
                PopupMenuItem<String>(
                  value: 'delete',
                  child: Text('delete'.tr),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
