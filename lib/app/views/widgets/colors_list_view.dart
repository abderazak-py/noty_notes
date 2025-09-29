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
  late bool isPickerSelected;
  @override
  void initState() {
    super.initState();
    isPickerSelected = false;
    selectedIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Color.fromARGB(255, 109, 119, 173),
      Color(0xFFFF5252),
      Color(0xFFFF6D00),
      Color(0xFFFFC107),
      Color(0xFFFFEB3B),
      Color(0xFF00C853),
      Color(0xFF00BFA5),
      Color(0xFF00E5FF),
      Color(0xFF2979FF),
      Color(0xFF651FFF),
      Color(0xFFE040FB),
      Color(0xFFFFCDD2),
      Color(0xFFFFE0B2),
      Color(0xFFFFF9C4),
      Color(0xFFC8E6C9),
      Color(0xFFB2DFDB),
      Color(0xFFBBDEFB),
      Color(0xFFD1C4E9),
      Color(0xFFFFF0F5),
      Color(0xFFE0E0E0),
      Color(0xFFFFFFFF),
    ];
    return SizedBox(
      height: 130,
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: colors.length + 1,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 🔥 exactly 2 rows
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 1, // keep items square
        ),

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
                        onPressed: () {
                          setState(() {
                            selectedIndex = -1;
                            isPickerSelected = true;
                          });
                          Get.back();
                        },
                      ),
                    ],
                  ),
                );
              },
              child: ColorPickerBubble(
                color: widget.currentColor,
                isSelected: isPickerSelected,
              ),
            );
          } else {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index - 1;
                  widget.currentColor.value = colors[index - 1];
                  isPickerSelected = false;
                });
              },
              child: ColorBubble(
                color: colors[index - 1],
                isSelected:
                    (selectedIndex == index - 1 ||
                    widget.currentColor.value == colors[index - 1]),
              ),
            );
          }
        },
      ),
    );
  }
}
