import 'package:flutter/material.dart';

class ColorBubble extends StatelessWidget {
  const ColorBubble({super.key, required this.color, required this.isSelected});
  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected ? Border.all(color: Colors.white, width: 3) : null,
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
        child: Visibility(
          visible: isSelected,
          child: Center(child: Icon(Icons.done)),
        ),
      ),
    );
  }
}
