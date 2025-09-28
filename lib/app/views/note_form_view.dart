import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noty_notes/app/controllers/note_controller.dart';
import 'package:noty_notes/app/models/note_model.dart';
import 'package:noty_notes/app/views/widgets/note_form_body.dart';

class NoteFormView extends StatelessWidget {
  const NoteFormView({super.key});
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments;
    final NoteModel oldNote = args['oldNote'] as NoteModel;
    final bool isAdding = args['isAdding'] as bool;

    final NoteController noteController = Get.find<NoteController>();
    final TextEditingController titleController = TextEditingController(
      text: oldNote.title,
    );
    final TextEditingController contentController = TextEditingController(
      text: oldNote.content,
    );
    var currentColor = oldNote.color.obs;

    return Scaffold(
      appBar: AppBar(
        title: Text(isAdding ? 'add_note'.tr : 'edit_note'.tr),
        actions: [
          IconButton(
            onPressed: () {
              if (titleController.text.isEmpty ||
                  contentController.text.isEmpty) {
                Get.snackbar('erorr'.tr, 'empty_note'.tr);
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
      ),

      body: NoteFormBody(
        titleController: titleController,
        contentController: contentController,
        currentColor: currentColor,
      ),
    );
  }
}
