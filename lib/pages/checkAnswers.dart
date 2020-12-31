import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'home.dart';

// ignore: must_be_immutable
class CheckAnswers extends StatefulWidget {
  int totalNumber;
  List selectedAnswer;
  CheckAnswers({this.selectedAnswer, this.totalNumber});
  @override
  _CheckAnswersState createState() => _CheckAnswersState();
}

class _CheckAnswersState extends State<CheckAnswers> {
  Future getQA() async {
    try {
      var url = "http://10.0.2.2:8080/quiz_app/checkAnswers.php";
      var response = await http.get(url);
      var responsbody = convert.jsonDecode(response.body);
      return responsbody;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Check Answers'),
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
            future: getQA(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                    ClipPath(
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey[900],
                      ),
                      clipper: MyCustemClipper(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ListView.builder(
                          itemCount: widget.totalNumber,
                          itemBuilder: (context, i) {
                            return Container(
                                width: 370,
                                height: 120,
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: Card(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 17, left: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                            text: TextSpan(
                                                text: snapshot.data[i]
                                                    ['question'],
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.grey))),
                                        Text(
                                          widget.selectedAnswer[i],
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: widget.selectedAnswer[i] ==
                                                      snapshot.data[i]
                                                          ['correctAnswer']
                                                  ? Colors.green
                                                  : Colors.red),
                                        ),
                                        widget.selectedAnswer[i] !=
                                                snapshot.data[i]
                                                    ['correctAnswer']
                                            ? Row(children: [
                                                Text('Answer : ',
                                                    style: TextStyle(
                                                        fontSize: 17)),
                                                Text(
                                                    snapshot.data[i]
                                                        ['correctAnswer'],
                                                    style:
                                                        TextStyle(fontSize: 17,color: Colors.blue))
                                              ])
                                            : Padding(
                                                padding: EdgeInsets.all(0)),
                                      ],
                                    ),
                                  ),
                                ));
                          }),
                    )
                  ],
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
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
