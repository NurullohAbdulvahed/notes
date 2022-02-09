import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_darsda/models/note_model.dart';

class NoteUI extends StatefulWidget {
  const NoteUI({Key? key}) : super(key: key);

  @override
  _NoteUIState createState() => _NoteUIState();
}

class _NoteUIState extends State<NoteUI> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text("Notes"),
        backgroundColor: Colors.blueAccent.shade400,
      ),

    );
  }
}
