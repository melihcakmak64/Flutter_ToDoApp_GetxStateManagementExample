import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/NoteModel.dart';
import 'package:flutter_application_1/widgets/NoteCard.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ToDoController controller = Get.put(ToDoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("TOdos"),
      ),
      body: Column(children: [
        _MyContainer(),
        ElevatedButton(
            onPressed: () {
              Get.bottomSheet(myCard());
            },
            child: const Text("Add Task"))
      ]),
    );
  }

  Container _MyContainer() {
    return Container(
      height: Get.height * 0.8,
      child: Obx(
        () => ListView.builder(
          itemCount: controller.getList().length,
          itemBuilder: (context, index) {
            return NoteCard(note: controller.getList()[index]);
          },
        ),
      ),
    );
  }

  Card myCard() {
    return Card(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Please enter task:",
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            controller.addNote(Note(note: value));
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
