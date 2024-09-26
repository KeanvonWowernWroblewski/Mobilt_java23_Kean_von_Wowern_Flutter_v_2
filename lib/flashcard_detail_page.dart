import 'package:flutter/material.dart';
import 'flashcard.dart';

class FlashcardDetailPage extends StatefulWidget {
  final Flashcard flashcard;
  final Function(Flashcard) onSave;

  FlashcardDetailPage({required this.flashcard, required this.onSave});

  @override
  FlashcardDetailPageState createState() => FlashcardDetailPageState();
}

class FlashcardDetailPageState extends State<FlashcardDetailPage> {
  TextEditingController questionEditController = TextEditingController();
  TextEditingController answerEditController = TextEditingController();

  @override
  void initState() {
    super.initState();
    questionEditController.text = widget.flashcard.question;
    answerEditController.text = widget.flashcard.answer;
  }

  void saveUpdatedFlashcard() {
    widget.onSave(
      Flashcard(
        question: questionEditController.text,
        answer: answerEditController.text,
        isFlipped: widget.flashcard.isFlipped,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit flashcard'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: questionEditController,
              decoration: InputDecoration(labelText: 'Edit question'),
            ),
            TextField(
              controller: answerEditController,
              decoration: InputDecoration(labelText: 'Edit answer'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: saveUpdatedFlashcard,
              child: Text('Save', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
