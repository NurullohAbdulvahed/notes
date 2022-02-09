import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_darsda/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefService{

  static Future <bool> storeNote(Note note) async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    String noteString = jsonEncode(note.toJson());
    if (kDebugMode) {
      print("Encode string text: $noteString");
    }
    return await pref.setString("note", noteString);
  }
  // static Future<Note> loadNote() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? result = pref.getString("note");
  //   Map<String,dynamic> json = jsonDecode(result!);
  //   Note note = Note.fromJson(json);
  //   return note;
  // }
  static Future<Note> loadNote() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? result = pref.getString("note");
    print("LoadNote string text: $result");
    return Note.fromJson(jsonDecode(result!));
  }
  static Future<bool> removeNote() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.remove("note");
  }

  /// notelist

  static Future<bool> storeNoteList(List<Note> list) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> stringList = list.map((note) => jsonEncode(note.toJson())).toList();
    return await pref.setStringList("noteList", stringList);
  }

  static Future<List<Note>> loadNoteList() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? stringList = pref.getStringList("noteList");
    List mapList = stringList!.map((string) => jsonDecode(string)).toList();
    List<Note> noteList = mapList.map((json) => Note.fromJson(json)).toList();
    return noteList;
  }


  // static Future<List<Note>> loadNoteList() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   // List<Note>? noteList =  pref.getStringList("noteList")?.map((stringNote) => Note.fromJson(jsonDecode(stringNote))).toList();
  //   List<String>? stringList = pref.getStringList('noteList');
  //   List mapList = stringList!.map((string) => jsonDecode(string)).toList();
  //   List<Note> noteList = mapList.map((json) => Note.fromJson(json)).toList();
  //   return noteList;
  // }
}