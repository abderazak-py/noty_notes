import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:noty_notes/app/models/note_model.dart';

class NoteService extends GetxService {
  final storage = GetStorage();
  var notes = <NoteModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    List storedNotes = storage.read<List>('notes') ?? [];
    notes = storedNotes.map((item) => NoteModel.fromJson(item)).toList().obs;
  }

  void addNote(NoteModel note) {
    notes.add(note);
    saveNotes();
  }

  void removeNote(NoteModel note) {
    notes.remove(note);
    saveNotes();
  }

  void editNote(NoteModel oldNote, NoteModel newNote) {
    int index = notes.indexOf(oldNote);
    if (index != -1) {
      notes[index] = newNote;
      saveNotes();
    }
  }

  void toggleStar(NoteModel note) {
    note.isPinned.value = !note.isPinned.value;
    saveNotes();
  }

  void saveNotes() {
    storage.write('notes', notes.map((item) => item.toJson()).toList());
  }

  List<NoteModel> get sortedNotes {
    final sorted = notes.toList();
    sorted.sort((a, b) {
      int aStar = a.isPinned.value ? 1 : 0;
      int bStar = b.isPinned.value ? 1 : 0;
      return bStar.compareTo(aStar);
    });
    return sorted;
  }
}
