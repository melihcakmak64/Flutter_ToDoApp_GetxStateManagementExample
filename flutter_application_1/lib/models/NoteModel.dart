class Note {
  final String note;

  late final String id;

  Note({required this.note}) {
    id = DateTime.now().toString(); //Date is used as a unique id.
  }

  String getId() {
    return id;
  }
}
