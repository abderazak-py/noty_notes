import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noty_notes/app/views/widgets/colors_list_view.dart';
import 'package:noty_notes/app/views/widgets/custom_text_field.dart';

class NoteFormBody extends StatelessWidget {
  const NoteFormBody({
    super.key,
    required this.titleController,
    required this.contentController,
    required this.currentColor,
  });

  final TextEditingController titleController;
  final TextEditingController contentController;
  final Rx<Color> currentColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 10,
              ),
              child: CustomTextField(
                controller: titleController,
                hintText: 'title'.tr,
                maxLines: 1,
              ),
            ),

            Divider(color: Colors.grey.shade300, indent: 20, endIndent: 20),

            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
                bottom: 20,
              ),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.58,
                child: CustomTextField(
                  controller: contentController,
                  hintText: 'content'.tr,
                  maxLines: 30,
                ),
              ),
            ),

            ColorsListView(currentColor: currentColor),
          ],
        ),
      ),
    );
  }
}
