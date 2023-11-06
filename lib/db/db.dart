import 'package:hive/hive.dart';

class ToDoDB {
  List toDoList = [];

  //box reference

  final _box = Hive.box('todo');

  //only FIRST time
  void createInitialData() {
    toDoList = [
      ["Do Exercise", false],
      ["Bring Milk", false],
    ];
  }


  void loadData(){

      toDoList = _box.get('todo') ?? [];

  }

  void updateDatabase() {

    _box.put('todo', toDoList);
  }

}
