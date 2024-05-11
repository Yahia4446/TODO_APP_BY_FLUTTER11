import 'package:flutter/material.dart';
import 'package:simple_todo/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController(); //textdeit..func to get the user input and store it in the text field
  List toDoList = [ // items
    ['tryyy', true], //name , check box
    ['ffff', true],
    ['gggg', false],
    ['kkk', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]); // user to do , unfinced box
      _controller.clear(); // this func to clear text box
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index); //to remove the indx
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        title: const Text(
          'just do it',
        ),
        backgroundColor: Color( ),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(  // to make contuenrs
        itemCount: toDoList.length, //based on length it will creat to do
        itemBuilder: (BuildContext context, index) {
          return TodoList(             //we need to make item
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(index) , // cheakbox it's func 0=true ,1=fals
            deleteFunction: (contex) => deleteTask(index),  // to delete the the todo
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextField(
                  controller: _controller, // we use controller to get user input
                  decoration: InputDecoration(
                    hintText: 'Add a new todo items',
                    filled: true,
                    fillColor: Color(0xff9ac9f3),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff0d47a1),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xff4ea0e3),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              backgroundColor:Color(0xff0d47a1) ,
              foregroundColor:Colors.white ,
              onPressed: saveNewTask,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
