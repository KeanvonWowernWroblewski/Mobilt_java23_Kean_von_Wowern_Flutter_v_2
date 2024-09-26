import 'package:flutter/material.dart';
import 'flashcard_detail_page.dart';
import 'flashcard.dart';

class FlashcardListPage extends StatefulWidget {
  @override
  FlashcardListPageState createState() => FlashcardListPageState();
}

class FlashcardListPageState extends State<FlashcardListPage> {
  List<Flashcard> flashcardList = [];
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  void addFlashcard() {
    setState(() {
      Flashcard newFlashcard = Flashcard(
        question: questionController.text,
        answer: answerController.text,
      );
      flashcardList.add(newFlashcard);
      questionController.clear();
      answerController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flashcards list'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  controller: questionController,
                  decoration: InputDecoration(
                    labelText: 'Question:',
                  ),
                ),
                TextField(
                  controller: answerController,
                  decoration: InputDecoration(
                    labelText: 'Answer:',
                  ),
                ),
                ElevatedButton(
                  onPressed: addFlashcard,
                  child: Text('Add flashcard', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: flashcardList.length,
              itemBuilder: (context, index) {
                Flashcard currentFlashcard = flashcardList[index];
                return Card(
                  color: Colors.white60,
                  child: ListTile(
                    leading: Image.asset('assets/flashcard.png'),
                    title: Text(
                      currentFlashcard.isFlipped
                          ? currentFlashcard.answer
                          : currentFlashcard.question,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FlashcardDetailPage(
                              flashcard: currentFlashcard,
                              onSave: (updatedFlashcard) {
                                setState(() {
                                  flashcardList[index] = updatedFlashcard;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    onTap: () {
                      setState(() {
                        currentFlashcard.isFlipped = !currentFlashcard.isFlipped;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
