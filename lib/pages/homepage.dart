import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_hive/db/db.dart';
import 'package:todo_hive/util/dialogBox.dart';
import 'package:todo_hive/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _box = Hive.box('todo');

  ToDoDB db = ToDoDB();


  @override
  void initState() {
    super.initState();
    if (_box.get('todo') == null) {  //first time app is opened
      db.createInitialData();
      // db.updateDatabase();
    } else {
      db.loadData();
    }


  }

  final _controller = TextEditingController();

  

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  //add new task
  void addNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
    db.updateDatabase();
  }



  //create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogBox(
          controller: _controller,
          onAdd: addNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue[400],
          title: const Text('To-Do'),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                taskName: db.toDoList[index][0],
                taskStatus: db.toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context){
                  deleteTask(index);
                }
              );
            }));
  }
}
