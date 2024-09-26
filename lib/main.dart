import 'package:flutter/material.dart';
import 'flashcard_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashcard app',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: FlashcardListPage(),
    );
  }
}
