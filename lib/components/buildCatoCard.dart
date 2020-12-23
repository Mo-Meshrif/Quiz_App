
import 'package:flutter/material.dart';
InkWell buildCatoCard({String url, String text, Function method}) {
  return InkWell(
    child: Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            url,
            fit: BoxFit.cover,
            height: 50,
            width: 50,
          ),
          SizedBox(height: 5,),
          Text(text)
        ],
      ),
    ),
    onTap: method,
  );
}