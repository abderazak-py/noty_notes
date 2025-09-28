import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:noty_notes/app/views/widgets/color_bubble.dart';
import 'package:noty_notes/app/views/widgets/color_picker_bubble.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key, required this.currentColor});

  final Rx<Color> currentColor;

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  late int selectedIndex;
  @override
  void initState() {
    super.initState();
    selectedIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Color(0xffF94144),
      Color(0xffF3722C),
      Color(0xffF8961E),
      Color(0xffF9844A),
      Color(0xffF9C74F),
      Color(0xff90BE6D),
      Color(0xff43AA8B),
      Color(0xff4D908E),
      Color(0xff577590),
      Color(0xff277DA1),
    ];
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: colors.length + 1,

        itemBuilder: (context, index) {
          if (index == 0) {
            return GestureDetector(
              onTap: () {
                Get.dialog(
                  AlertDialog(
                    title: Text('pick_color'.tr),
                    content: SingleChildScrollView(
                      child: ColorPicker(
                        pickerColor: widget.currentColor.value,
                        onColorChanged: (color) {
                          widget.currentColor.value = color;
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
              child: ColorPickerBubble(color: widget.currentColor),
            );
          } else {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index - 1;
                  widget.currentColor.value = colors[index - 1];
                });
              },
              child: ColorBubble(
                color: colors[index - 1],
                isSelected:
                    (selectedIndex == [index - 1] ||
                    widget.currentColor.value == colors[index - 1]),
              ),
            );
          }
        },
      ),
    );
  }
}
