import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'app_name': 'Noty Notes',
      'title': 'Title',
      'content': 'Description',
      'error': 'Error',
      'empty_note': 'Fill all fields',
      'save': 'Save',
      'remove': 'Remove Note',
      'confirm_remove':
          'Are you sure you want to remove this item from the cart?',
      'yes': 'Yes',
      'no': 'No',
      'done': 'Done',
      'pick_color': 'Pick a color',
      'color': 'Color',
      'pin': 'Pin',
      'edit': 'Edit',
      'delete': 'Delete',
      'unpin': 'Unpin',
    },
    'ar_AR': {
      'app_name': 'مذكرات نوتي',
      'title': 'العنوان',
      'content': 'الوصف',
      'error': 'خطأ',
      'empty_note': 'املء كل الحقول',
      'save': 'حفظ',
      'remove': 'حذف المذكرة',
      'confirm_remove': 'هل أنت متأكد أنك تريد حذف المذكرة',
      'yes': 'نعم',
      'no': 'لا',
      'done': 'تم',
      'pick_color': 'اختر لونا',
      'color': 'اللون',
      'pin': 'تثبيت',
      'edit': 'تعديل',
      'delete': 'حذف',
      'unpin': 'الغاء التثبيت',
    },
  };
}
