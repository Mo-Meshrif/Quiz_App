import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../pages/home.dart';
import '../pages/results.dart';

// ignore: must_be_immutable
class Questions extends StatefulWidget {
  String questionsCatogory;
  List<String> selectedNumber;
  List<String> selectedDifficult;
  Questions(
      {this.selectedNumber, this.selectedDifficult, this.questionsCatogory});
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int groupVal = 1;
  int index = 0;
  List selectedAnswer = [];

  Future getQuiz() async {
    try {
      var url = "http://10.0.2.2:8080/quiz_app/quiz.php";
      var data = {
        'catogory': widget.questionsCatogory,
        'level': widget.selectedDifficult.last,
      };
      var response = await http.post(url, body: data);
      var responsbody = convert.jsonDecode(response.body);
      return responsbody;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getQuiz(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data.length != 0) {
                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      top: 23,
                      child: ClipPath(
                        child: Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey[900],
                        ),
                        clipper: MyCustemClipper(),
                      ),
                    ),
                    Positioned(
                        top: 30,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 110,
                            child: ListTile(
                              title: Text(
                                snapshot.data[index]["questionType"],
                                style: TextStyle(fontSize: 18),
                              ),
                              trailing: IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return Home();
                                    }));
                                  }),
                            ))),
                    Positioned(
                        top: 105,
                        left: 30,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue[700],
                              foregroundColor: Colors.white,
                              child: Text("${index + 1}"),
                            ),
                            Container(
                                width: 300,
                                padding: EdgeInsets.only(left: 15),
                                child: RichText(
                                    text: TextSpan(
                                        text: snapshot.data[index]["question"],
                                        style: TextStyle(fontSize: 20))))
                          ],
                        )),
                    for (int i = 0; i < 4; i++)
                      buildMyRadioCard(
                          top: 300 + i.toDouble() * 65,
                          answer: snapshot.data[index]["answer${i + 1}"],
                          snap: snapshot),
                  ],
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }

  Positioned buildMyRadioCard(
      {double top, String answer, AsyncSnapshot<dynamic> snap}) {
    var _genderRadioBtnVal;
    return Positioned(
        top: top,
        left: 15,
        child: Container(
          width: 370,
          padding: EdgeInsets.only(left: 15),
          child: Card(
            child: ListTile(
              leading: Radio(
                value: answer,
                groupValue: _genderRadioBtnVal,
                onChanged: (T) {
                  setState(() {
                    _genderRadioBtnVal = T;
                    if (index < int.parse(widget.selectedNumber.last)) {
                      if (index <= snap.data.length - 1) {
                        index++;
                        selectedAnswer.add(_genderRadioBtnVal);
                        if (index == snap.data.length) {
                          index--;
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Results(selectedAnswer:selectedAnswer,);
                          }));
                        }
                      }
                    }
                  });
                },
                activeColor: Colors.blue,
              ),
              title: RichText(
                  text: TextSpan(text: answer, style: TextStyle(fontSize: 15))),
              trailing: Icon(
                Icons.circle,
                size: 13,
                color: Colors.blue,
              ),
            ),
          ),
        ));
  }
}

class MyCustemClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 10);
    var firstController = new Offset(size.width / 4, size.height + 8);
    var firstEndpoint = new Offset(size.width / 2, size.height * 0.88);
    path.quadraticBezierTo(firstController.dx, firstController.dy,
        firstEndpoint.dx, firstEndpoint.dy);
    var secondController = new Offset(size.width * 0.75, size.height / 1.5);
    var secondEndpoint = new Offset(size.width, size.height / 1.3);
    path.quadraticBezierTo(secondController.dx, secondController.dy,
        secondEndpoint.dx, secondEndpoint.dy);
    path.lineTo(size.width, size.height / 1.3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
