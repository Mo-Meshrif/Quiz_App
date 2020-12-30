import 'package:flutter/material.dart';

Card buildRestultCard({String text1, String text2}) {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(top: 12),
        child: Column(
          children: [
            Text(
              text1,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              text2,
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.blue[700],
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

