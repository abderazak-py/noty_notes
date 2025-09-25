import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.maxLines,
  });

  final TextEditingController controller;
  final int maxLines;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),

        hintText: hintText,
      ),
    );
  }
}
