import 'package:get/get.dart';

import '../models/NoteModel.dart';

class ToDoController extends GetxController {
  final RxList<Note> _toDoList = <Note>[].obs;

  void addNote(Note note) {
    _toDoList.add(note);
  }

  void removeNote(Note note) {
    _toDoList.removeWhere((element) => element.getId() == note.getId());
  }

  RxList<Note> getList() {
    return _toDoList;
  }
}
