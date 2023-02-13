import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/NoteModel.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class NoteCard extends StatefulWidget {
  final Note note;
  const NoteCard({super.key, required this.note});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  ToDoController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: ListTile(
        leading: Text(
          widget.note.note,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        trailing: IconButton(
            onPressed: () {
              controller.removeNote(widget.note);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            )),
      ),
    );
  }
}
