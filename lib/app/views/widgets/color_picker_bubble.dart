import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ColorPickerBubble extends StatelessWidget {
  const ColorPickerBubble({
    super.key,
    required this.color,
    this.isSelected = false,
  });
  final Rx<Color> color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: color.value,
            shape: BoxShape.circle,
            border: isSelected
                ? Border.all(color: Colors.white, width: 3)
                : null,
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ]
                : null,
          ),
          child: Center(child: Icon(Icons.colorize)),
        ),
      ),
    );
  }
}
