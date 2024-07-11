import 'package:flutter/material.dart';
import 'package:todo_uygulamasi/constant/tasktype.dart';
import 'package:todo_uygulamasi/model/task.dart';
import 'package:todo_uygulamasi/screens/AddNewTask.dart';
import 'package:todo_uygulamasi/service/todo_service.dart';
import '../todoitem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*List<String> todo = [
    "Ödevini Yap",
    "Faturayı yatır",
    "Beyza'nın doğum gününü aramayı unutma"
  ];
  List<String> completed = ["Spor yap", "Matematik Çalış"];
  */

  List<Task> todo =[
    Task(type: Tasktype.note, title: "Ödevini Yap", description: "Fizik testlerini çöz", isCompleted: false),
    Task(type: Tasktype.calendar, title: "Faturayı yatır", description: "Elektrik faturasını yatır", isCompleted: false),
    Task(type: Tasktype.contest, title: "Doğum günü için aramayı unutma", description: "Beyza'nın doğum gününü aramayı unutma", isCompleted: false),
  ];
  List<Task> completed =[
    Task(type: Tasktype.calendar, title: "Faturayı yatır", description: "Elektrik faturasını yatır", isCompleted: false),
    Task(type: Tasktype.contest, title: "Doğum günü için aramayı unutma", description: "Beyza'nın doğum gününü aramayı unutma", isCompleted: false),
  ];

  void addNewTask(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }
  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();
    todoService.getTodos();
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
        body: Column(
          children: [
            //Header
            Container(
              height: deviceHeight / 3,
              width: deviceWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/Header.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "9 Temmuz 2024",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "My ToDo List",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            //Top Column
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SingleChildScrollView(
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: todo.length,
                    itemBuilder: (context, index) {
                      return TodoItem(task: todo[index]);
                    },
                  ),
                ),
              ),
            ),
            //Completed Text
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tamamlananlar",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            //Bottom Column
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SingleChildScrollView(
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: completed.length,
                    itemBuilder: (context, index) {
                      return TodoItem(task: completed[index]);
                    },
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                   MaterialPageRoute(
                    builder: (context) => AddNewTask(
                      addNewTask: (newtask) => addNewTask(newtask),
                    ),
                  ),
                );
              },
              child: const Text("Add New Task"),
            ),
          ],
        ),
      ),
    );
  }
}
