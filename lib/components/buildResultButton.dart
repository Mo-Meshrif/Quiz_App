import 'package:flutter/material.dart';

RaisedButton buildResultButton({IconData icon, String text,Function method}) {
    return RaisedButton(
        color: Colors.grey[800],
        onPressed: method,
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.blue[700],
            ),
            SizedBox(
              width: 5,
            ),
            Text(text)
          ],
        ));
  }