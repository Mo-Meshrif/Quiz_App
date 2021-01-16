import 'package:flutter/material.dart';
import '../models/categories.dart';
import '../components/buildCatoCard.dart';
import 'questionSelector.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Quiz App"),
          centerTitle: true,
        ),
        body: GridView.count(
            crossAxisCount: 2,
            children: categories
                .map(
                  (val) => buildCatoCard(
                      url: val.images,
                      text: val.cato,
                      method: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return QuestionsSelector(
                            appbarTitle: val.cato,
                          );
                        }));
                      }),
                )
                .toList()));
  }
}
