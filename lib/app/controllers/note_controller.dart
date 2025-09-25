import 'package:get/get.dart';
import 'package:noty_notes/app/models/note_model.dart';
import 'package:noty_notes/app/services/note_service.dart';

class NoteController extends GetxController {
  final NoteService notesService = Get.find<NoteService>();

  List<NoteModel> get notes => notesService.notes;

  void addNote(NoteModel note) {
    notesService.addNote(note);
    update();
  }

  void removeNote(NoteModel note) {
    notesService.removeNote(note);
    update();
  }

  void editNote(NoteModel oldNote, NoteModel newNote) {
    notesService.editNote(oldNote, newNote);
    update();
  }

  void toggleStar(NoteModel note) {
    notesService.toggleStar(note);
    update();
  }

  List<NoteModel> get sortedNotes {
    return notesService.sortedNotes;
  }
}
