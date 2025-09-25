import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:noty_notes/app/binding/note_binding.dart';
import 'package:noty_notes/app/routes/app_routes.dart';
import 'package:noty_notes/app/views/note_form_view.dart';
import 'package:noty_notes/app/views/home_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: NoteBinding(),
    ),
    GetPage(name: AppRoutes.noteFormView, page: () => NoteFormView()),
  ];
}
