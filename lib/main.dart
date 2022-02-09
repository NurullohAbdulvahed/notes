import 'package:flutter/material.dart';
import 'package:shared_darsda/pages/home_page.dart';
import 'package:shared_darsda/pages/noteUi.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        HomePage.id : (context) => HomePage(),
      },
    );
  }
}


