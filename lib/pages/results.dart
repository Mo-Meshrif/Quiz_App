import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../components/buildRestultCard.dart';
import '../components/buildResultButton.dart';
import 'checkAnswers.dart';
import 'home.dart';

// ignore: must_be_immutable
class Results extends StatefulWidget {
  int totalNumber;
  List selectedAnswer;
  Results({this.selectedAnswer, this.totalNumber});
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  int correct = 0;
  int wrong = 0;

  _getCorrectAnswers() async {
    try {
      var url = "http://10.0.2.2:8080/quiz_app/correctAnswers.php";
      var response = await http.get(url);
      var responsbody = convert.jsonDecode(response.body);
      return responsbody;
    } catch (e) {
      _showdialog(context, e);
    }
  }

  _showdialog(context, e) {
    return showDialog(
        context: (context),
        builder: (context) {
          return AlertDialog(
            title: Text("Alert"),
            content: Text(
              "The server is dropped !",
              style: TextStyle(fontSize: 20),
            ),
            actions: [
              RaisedButton(
                  child: Text(
                    'Exit',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Home();
                    }));
                  })
            ],
          );
        });
  }

  _getResults(AsyncSnapshot snapshot) {
    for (int i = 0; i < snapshot.data.length; i++) {
      if (widget.selectedAnswer[i] == snapshot.data[i]['correctAnswer']) {
        correct++;
      } else {
        wrong++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Result"),
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
        ),
        body: FutureBuilder(
            future: _getCorrectAnswers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _getResults(snapshot);
                return Container(
                    padding: EdgeInsets.all(15),
                    child: ListView(
                      children: [
                        Container(
                          height: 400,
                          child: GridView.count(
                            crossAxisCount: 2,
                            children: [
                              buildRestultCard(
                                  text1: "Total Questions",
                                  text2: "${widget.totalNumber}"),
                              buildRestultCard(
                                  text1: "Score Rate",
                                  text2:
                                      "${correct / widget.totalNumber * 100}%"),
                              buildRestultCard(
                                  text1: "Correct Answers",
                                  text2: "$correct/${widget.totalNumber}"),
                              buildRestultCard(
                                  text1: "Incorrect Answers",
                                  text2: "$wrong/${widget.totalNumber}"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 105),
                        ),
                        Row(
                          children: [
                            Container(
                                height: 40,
                                padding: EdgeInsets.only(left: 65),
                                child: buildResultButton(
                                    icon: Icons.home,
                                    text: 'Go Home',
                                    method: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return Home();
                                      }));
                                    })),
                            Container(
                                height: 40,
                                padding: EdgeInsets.only(left: 7),
                                child: buildResultButton(
                                    icon: Icons.assignment_turned_in,
                                    text: 'Check Answers',
                                    method: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return CheckAnswers();
                                      }));
                                    })),
                          ],
                        )
                      ],
                    ));
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
