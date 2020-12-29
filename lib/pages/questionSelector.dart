import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../components/buildChoiceChip.dart';
import 'home.dart';
import 'questions.dart';

class QuestionsSelector extends StatefulWidget {
  final appbarTitle;
  QuestionsSelector({this.appbarTitle});
  @override
  _QuestionsSelectorState createState() => _QuestionsSelectorState();
}

class _QuestionsSelectorState extends State<QuestionsSelector> {
  Future prepareQuiz() async {
    try {
      var url = "http://10.0.2.2:8080/quiz_app/prepareQuiz.php";
      var data = {
        'catogory': widget.appbarTitle,
      };
      var response = await http.post(url, body: data);
      var responsbody = convert.jsonDecode(response.body);
      return responsbody;
    } catch (e) {
      print(e);
    }
  }

  List<String> selectedNumber = new List();
  List<String> selectedDifficult = new List();
  _showdialog(context) {
    return showDialog(
        context: (context),
        builder: (context) {
          return AlertDialog(
            title: Text("Alert"),
            content: Text(
              "Please select the question numbers and those difficulty !",
              style: TextStyle(fontSize: 20),
            ),
            actions: [
              RaisedButton(
                  child: Text(
                    'Exit',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(widget.appbarTitle),
          actions: [
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Home();
                  }));
                }),
          ],
          // leading:
        ),
        body: FutureBuilder(
            future: prepareQuiz(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data.length != 0) {
                return Container(
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
                              try {
                                if (selectedNumber.last != null &&
                                    // ignore: unrelated_type_equality_checks
                                    selectedDifficult.last != Null) {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return Questions(
                                      questionsCatogory: widget.appbarTitle,
                                      selectedNumber: selectedNumber,
                                      selectedDifficult: selectedDifficult,
                                    );
                                  }));
                                }
                              } catch (e) {
                                _showdialog(context);
                              }
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
                );
              }
              return Center(
                      child: Text(
                        'Comming Sooooooooooon !',
                        style: TextStyle(fontSize: 20),
                      ),
                    );
            }));
  }
}
