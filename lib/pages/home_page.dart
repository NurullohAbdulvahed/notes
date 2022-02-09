import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_darsda/models/note_model.dart';
import 'package:shared_darsda/services/pref_services.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  Note? note;
  List<Note> listNote = [];

  @override
  void initState() {
    loadListNotes();
    super.initState();
  }



  ///alertDialog
  void _androidDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              MaterialButton(
                onPressed: () {
                  _storeNoteList();
                  loadListNotes();
                },
                child: Text("Save"),
              )
            ],
            title: Text(
              "Add New Notes",
              textAlign: TextAlign.center,
            ),
            content: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      hintText: "write title",
                      hintStyle: TextStyle(color: Colors.green)),
                ),
                TextField(
                  controller: contentController,
                  decoration: InputDecoration(
                      hintText: "write content",
                      hintStyle: TextStyle(color: Colors.green)),
                ),
              ],
            ),
          );
        });
  }


  ///storeNoteList
  void _storeNoteList() async {
    String addTitle = titleController.text.trim().toString();
    String addContent = contentController.text.trim().toString();
    Note note = Note(
        id: addTitle.hashCode,
        createTime: DateTime.now(),
        editTime: DateTime.now(),
        title: addTitle,
        content: addContent);
    listNote.add(note);
    await PrefService.storeNoteList(listNote).then((value) => {

        });
    Navigator.pop(context);
  }


  ///loadListNotes
  void loadListNotes() async {
    await PrefService.loadNoteList().then((value) => {
          setState(() {
            listNote = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child:ListView.builder(
                itemCount: listNote.length,
                itemBuilder: (context, index) {
                  return itemOfNote(context, index);
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _androidDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget itemOfNote(BuildContext context, int index) {
    return Card(
      child: ListTile(
        title: Text(listNote[index].title),
        subtitle: Text(listNote[index].content),
        trailing: Text(listNote[index].createTime.toString()),
      ),
    );
  }
}
