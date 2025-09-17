import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';

class NoteModel {
  String title;
  String content;
  DateTime date;
  RxBool isPinned;
  Color color;

  NoteModel({
    required this.title,
    required this.content,
    required this.date,
    RxBool? isPinned,
    this.color = Colors.blue,
  }) : isPinned = isPinned ?? false.obs;

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      title: json['title'],
      content: json['content'],
      date: DateTime.parse(json['date']),
      isPinned: (json['isPinned'] as bool).obs,
      color: Color(json['color'] ?? Colors.blue.toARGB32()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'date': date.toIso8601String(),
      'isPinned': isPinned.value,
      'color': color.toARGB32(),
    };
  }
}
