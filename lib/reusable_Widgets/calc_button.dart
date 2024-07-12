import 'package:flutter/material.dart';

Widget numberButton(String btntxt, Color txtcolor, Function(String) onButtonClick) {
  return Container(
    child: TextButton(
      onPressed: () {
        onButtonClick(btntxt);
      },
      child: Text(
        btntxt,
        style: TextStyle(
          fontSize: 30,
          color: txtcolor,
        ),
      ),
      style: ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
      ),
    ),
  );
}