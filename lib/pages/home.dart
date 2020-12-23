import 'package:flutter/material.dart';
import '../components/buildCatoCard.dart';

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
                method: () {}),
                buildCatoCard(
                url: "images/catogories/books.png",
                text: "Books",
                method: () {}),
                buildCatoCard(
                url: "images/catogories/film.png",
                text: "Film",
                method: () {}),
                buildCatoCard(
                url: "images/catogories/music.png",
                text: "Music",
                method: () {}),
                buildCatoCard(
                url: "images/catogories/football.png",
                text: "Football",
                method: () {}),
                buildCatoCard(
                url: "images/catogories/bodybuilding.png",
                text: "Bobybuilding",
                method: () {})
          ],
        ));
  }
}