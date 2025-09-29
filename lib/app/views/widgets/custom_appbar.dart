import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noty_notes/app/controllers/note_controller.dart';
import 'package:noty_notes/app/models/note_model.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.isAdding,
    required this.titleController,
    required this.contentController,
    required this.noteController,
    required this.currentColor,
    required this.oldNote,
  });

  final bool isAdding;
  final TextEditingController titleController;
  final TextEditingController contentController;
  final NoteController noteController;
  final Rx<Color> currentColor;
  final NoteModel oldNote;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(child: Text(isAdding ? 'add_note'.tr : 'edit_note'.tr)),
      actions: [
        IconButton(
          onPressed: () {
            if (titleController.text.isEmpty ||
                contentController.text.isEmpty) {
              Get.snackbar('error'.tr, 'empty_note'.tr);
              return;
            }

            if (isAdding) {
              noteController.addNote(
                NoteModel(
                  title: titleController.text,
                  content: contentController.text,
                  date: DateTime.now(),
                  color: currentColor.value,
                ),
              );
            } else {
              noteController.editNote(
                oldNote,
                NoteModel(
                  title: titleController.text,
                  content: contentController.text,
                  date: DateTime.now(),
                  color: currentColor.value,
                  isPinned: oldNote.isPinned,
                ),
              );
            }
            Get.back();
          },
          icon: Icon(Icons.done),
        ),
      ],

      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.close),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
