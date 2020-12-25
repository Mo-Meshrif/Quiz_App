import 'package:flutter/material.dart';
import '../components/buildChoiceChip.dart';
import 'questions.dart';

class QuestionsSelector extends StatefulWidget {
  final appbarTitle;
  QuestionsSelector({this.appbarTitle});
  @override
  _QuestionsSelectorState createState() => _QuestionsSelectorState();
}

class _QuestionsSelectorState extends State<QuestionsSelector> {
  List<String> selectedNumber = new List();
  List<String> selectedDifficult = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appbarTitle),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Select Total Number of Questions"),
            Container(
                padding: EdgeInsets.only(left: 55),
                height: 50,
                child: MyChoiceChip(
                    options: ['10', '20', '30', '40', '50'],
                    selected: selectedNumber)),
            SizedBox(
              height: 40,
            ),
            Text("Select Difficuity"),
            Container(
                padding: EdgeInsets.only(left: 80),
                height: 60,
                child: MyChoiceChip(
                    options: ['Easy', 'Medium', 'Hard'],
                    selected: selectedDifficult)),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 140,
              height: 40,
              child: FlatButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Questions(
                        selectedNumber: selectedNumber,
                        selectedDifficult: selectedDifficult,
                      );
                    }));
                  },
                  color: Colors.grey[800],
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_circle_fill,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Start Quiz'),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
