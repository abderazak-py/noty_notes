import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noty_notes/app/controllers/note_controller.dart';
import 'package:noty_notes/app/models/note_model.dart';
import 'package:noty_notes/app/views/widgets/custom_appbar.dart';
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
      appBar: CustomAppbar(
        isAdding: isAdding,
        titleController: titleController,
        contentController: contentController,
        noteController: noteController,
        currentColor: currentColor,
        oldNote: oldNote,
      ),

      body: NoteFormBody(
        titleController: titleController,
        contentController: contentController,
        currentColor: currentColor,
      ),
    );
  }
}
