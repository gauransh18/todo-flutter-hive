// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskStatus;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskStatus,
    this.onChanged,
    this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        right: 25,
        top: 25,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(onPressed: deleteFunction, 
            borderRadius: BorderRadius.circular(12.0),
            icon: Icons.delete,
            backgroundColor: Colors.red,)
          ]
        ),
        child: Container(
            padding: EdgeInsets.all(24.0),
            child: Row(
              children: [
                //check box
                Checkbox(
                  value: taskStatus,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                  ),
        
                //Task name
                Text(
                  taskName,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: taskStatus ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue[400],
              borderRadius: BorderRadius.circular(12.0),
            )),
      ),
    );
  }
}
