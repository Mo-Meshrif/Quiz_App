import 'package:flutter/material.dart';
import '../components/buildCatoCard.dart';
import 'questionSelector.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
          centerTitle: true,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            buildCatoCard(
                url: "images/catogories/gKnowloage.png",
                text: "Gerenal Knowloage",
                method: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return QuestionsSelector(
                      appbarTitle: "Gerenal Knowloage",
                    );
                  }));
                }),
            buildCatoCard(
                url: "images/catogories/books.png",
                text: "Books",
                method: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return QuestionsSelector(
                      appbarTitle: "Books",
                    );
                  }));
                }),
            buildCatoCard(
                url: "images/catogories/film.png",
                text: "Film",
                method: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return QuestionsSelector(
                      appbarTitle: "Film",
                    );
                  }));
                }),
            buildCatoCard(
                url: "images/catogories/music.png",
                text: "Music",
                method: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return QuestionsSelector(
                      appbarTitle: "Music",
                    );
                  }));
                }),
            buildCatoCard(
                url: "images/catogories/football.png",
                text: "Football",
                method: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return QuestionsSelector(
                      appbarTitle: "Football",
                    );
                  }));
                }),
            buildCatoCard(
                url: "images/catogories/bodybuilding.png",
                text: "Bobybuilding",
                method: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return QuestionsSelector(
                      appbarTitle: "Bobybuilding",
                    );
                  }));
                })
          ],
        ));
  }
}
