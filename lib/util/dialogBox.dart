// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_hive/util/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onAdd;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onAdd,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: ShapeBorder.lerp(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
            1),
        backgroundColor: Colors.blue[300],
        content: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Add a new task",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      text: "Add",
                      onPressed: onAdd,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Button(
                      text: "Cancel",
                      onPressed: onCancel,
                    ),
                  ],
                )
              ],
            )));
  }
}
